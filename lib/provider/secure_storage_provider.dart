import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pointycastle/api.dart';
import 'package:pointycastle/asymmetric/api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:xpns42/provider/crypto_provider.dart';

part 'secure_storage_provider.g.dart';

//@riverpod
//FlutterSecureStorage secureStorage(SecureStorageRef ref) {
//  return const FlutterSecureStorage(
//    aOptions: AndroidOptions(
//      encryptedSharedPreferences: true,
//    ),
//  );
//}

@riverpod
class SecureStorage extends _$SecureStorage {
  @override
  FlutterSecureStorage build() {
    return const FlutterSecureStorage(
      aOptions: AndroidOptions(
        encryptedSharedPreferences: true,
      ),
    );
  }

  FutureOr<void> storeKeys({
    required String account,
    required AsymmetricKeyPair<RSAPublicKey, RSAPrivateKey> keys,
  }) async {
    final crypto = ref.read(cryptoProvider);
    final publicKeyString = crypto.encodePublicKeyToPemPKCS1(keys.publicKey);
    final privateKeyString = crypto.encodePrivateKeyToPemPKCS1(keys.privateKey);
    await state.write(
      key: account,
      value: '''
$publicKeyString
$privateKeyString
''',
    );
  }

  Future<AsymmetricKeyPair<RSAPublicKey, RSAPrivateKey>> retreiveKeys({
    required String account,
  }) async {
    final keysAsString = await state.read(key: account);
    final keysAsStringArray = keysAsString!.split('\n\n');
    final publicKeyString = keysAsStringArray[0];
    final privateKeyString = keysAsStringArray[1];
    final crypto = ref.read(cryptoProvider);
    final publicKey = crypto.decodePublicKeyFromPemPKCS1(publicKeyString);
    final privateKey = crypto.decodePrivateKeyFromPemPKCS1(privateKeyString);

    return AsymmetricKeyPair<RSAPublicKey, RSAPrivateKey>(
      publicKey,
      privateKey,
    );
  }
}
