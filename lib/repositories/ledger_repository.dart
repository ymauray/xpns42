import 'package:firebase_database/firebase_database.dart';
import 'package:nanoid/nanoid.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:xpns42/models/ledger.dart';
import 'package:xpns42/providers/secure_storage_provider.dart';
import 'package:xpns42/repositories/base_repository.dart';

part 'ledger_repository.g.dart';

final class LedgerRepository extends BaseRepository {
  LedgerRepository({
    required this.ledgerRepositoryRef,
  });

  final LedgerRepositoryRef ledgerRepositoryRef;

  FutureOr<Ledger> createLedger({
    required String title,
    required String firstPerson,
    required String secondPerson,
    required String password,
  }) async {
    final accountsDBRef = FirebaseDatabase.instance.ref('/ledgers');
    final ledgerDBRef = accountsDBRef.push();

    final encoder = init(ledgerDBRef.key!, password);

    final ledger = Ledger(
      id: ledgerDBRef.key!,
      shortCode: nanoid(6),
      encryptedId: encoder.encrypt(ledgerDBRef.key!),
      title: encoder.encrypt(title),
      firstPerson: encoder.encrypt(firstPerson),
      secondPerson: encoder.encrypt(secondPerson),
    );

    await ledgerDBRef.set(ledger.toJson());

    return ledger;
  }

  FutureOr<void> deleteLedger(String id) async {
    final accountsDBRef = FirebaseDatabase.instance.ref('/ledgers');
    final ledgerDBRef = accountsDBRef.child(id);

    await ledgerDBRef.remove();
  }

  FutureOr<bool> unlockLedger({
    required String id,
    required String password,
  }) async {
    final accountDBRef = FirebaseDatabase.instance.ref('/ledgers/$id');
    final snapshot = await accountDBRef.get();
    if (snapshot.exists) {
      final jsonMap =
          Map<String, dynamic>.from(snapshot.value! as Map<dynamic, dynamic>);
      final account = Ledger.fromJson(jsonMap);

      final encoder = init(id, password);

      final decryptedId = encoder.decrypt(account.encryptedId);
      if (decryptedId == id) {
        final secureStorage =
            ledgerRepositoryRef.read(secureStorageProvider.notifier);
        await secureStorage.write(
          key: 'accountKey',
          value: password,
        );

        return true;
      }
    }
    return false;
  }
}

@riverpod
LedgerRepository ledgerRepository(LedgerRepositoryRef ref) {
  return LedgerRepository(ledgerRepositoryRef: ref);
}
