import 'package:encrypt/encrypt.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:xpns42/models/account.dart';
import 'package:xpns42/models/account_proxy.dart';
import 'package:xpns42/providers/account_list_provider.dart';
import 'package:xpns42/providers/secure_storage_provider.dart';

part 'account_repository.g.dart';

class AccountRepository {
  AccountRepository({
    required this.accountRef,
  });

  final AccountRef accountRef;

  FutureOr<List<AccountProxy>> loadAccounts() async {
    final secureStorage = accountRef.read(secureStorageProvider.notifier);
    final proxies = await secureStorage.getProxies();
    return proxies;
  }

  FutureOr<void> createAccount({
    required String title,
    required String firstPerson,
    required String secondPerson,
    required String password,
  }) async {
    final longPasswordBuffer = StringBuffer(password);
    while (longPasswordBuffer.length < 16) {
      longPasswordBuffer.write(password);
    }
    final longPassword = longPasswordBuffer.toString().substring(0, 16);

    final key = Key.fromUtf8(longPassword);
    final encrypter = Encrypter(AES(key));

    final accountsRef = FirebaseDatabase.instance.ref('/accounts');
    final accountRef = accountsRef.push();

    var id = accountRef.key!;
    if (id.length > 16) {
      id = id.substring(id.length - 16);
    }
    final iv = IV.fromUtf8(id);
    final encrypted = encrypter.encrypt(accountRef.key!, iv: iv);

    final account = Account(
      id: id,
      encryptedId: encrypted.base64,
      title: title,
      firstPerson: firstPerson,
      secondPerson: secondPerson,
    );
    await accountRef.set(account.toJson());

    final secureStorage = this.accountRef.read(secureStorageProvider.notifier);
    await secureStorage.write(
      key: 'accountKey',
      value: password,
    );

    final proxies = await secureStorage.getProxies();
    proxies.add(AccountProxy(id: accountRef.key!, title: title));
    await secureStorage.writeProxies(proxies);

    final accountList = this.accountRef.read(accountListProvider.notifier);
    await accountList.refresh(proxies);
  }

  Future<void> testLoad(String id) async {
    final accountRef = FirebaseDatabase.instance.ref('/accounts/$id');
    final snapshot = await accountRef.get();
    if (snapshot.exists) {
      final jsonMap =
          Map<String, dynamic>.from(snapshot.value! as Map<dynamic, dynamic>);
      final account = Account.fromJson(jsonMap);
      print(account);

      const password = 'gscmmj12';
      final longPasswordBuffer = StringBuffer(password);
      while (longPasswordBuffer.length < 16) {
        longPasswordBuffer.write(password);
      }
      final longPassword = longPasswordBuffer.toString().substring(0, 16);

      final key = Key.fromUtf8(longPassword);
      final encrypter = Encrypter(AES(key));

      final encrypted = Encrypted.fromBase64(account.encryptedId);
      if (id.length > 16) {
        id = id.substring(id.length - 16);
      }
      final iv = IV.fromUtf8(id);
      final decrypted = encrypter.decrypt(encrypted, iv: iv);

      print(id);
      print(decrypted);
    }
  }
}

@riverpod
AccountRepository account(AccountRef ref) {
  return AccountRepository(accountRef: ref);
}
