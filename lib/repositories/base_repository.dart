import 'package:encrypt/encrypt.dart';
import 'package:xpns42/models/ledger.dart';

final class Encoder {
  Encoder(this.encrypter, this.iv);

  final Encrypter encrypter;
  final IV iv;

  String encrypt(Object object) {
    final string = object.toString();
    final encrypted = encrypter.encrypt(string, iv: iv);
    return encrypted.base64;
  }

  Ledger encryptLedger(Ledger ledger) {
    return ledger.copyWith(
      title: encrypt(ledger.title),
      firstPerson: encrypt(ledger.firstPerson),
      secondPerson: encrypt(ledger.secondPerson),
      currency: encrypt(ledger.currency),
      shortCode: ledger.shortCode,
      password: '',
    );
  }

  String? decrypt(String string) {
    final encrypted = Encrypted.fromBase64(string);
    try {
      final decrypted = encrypter.decrypt(encrypted, iv: iv);
      return decrypted;
    } catch (e) {
      return null;
    }
  }
}

base class BaseRepository {
  Encoder init(String key, String password) {
    final longPasswordBuffer = StringBuffer(password);
    while (longPasswordBuffer.length < 16) {
      longPasswordBuffer.write(password);
    }
    final longPassword = longPasswordBuffer.toString().substring(0, 16);

    final passwordKey = Key.fromUtf8(longPassword);
    final encrypter = Encrypter(AES(passwordKey));

    var id = key;
    if (id.length > 16) {
      id = id.substring(id.length - 16);
    }
    final iv = IV.fromUtf8(id);

    return Encoder(encrypter, iv);
  }
}
