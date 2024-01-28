import 'dart:convert';
import 'dart:typed_data';

import 'package:pointycastle/export.dart';

abstract class BaseRepository {
  static String bin2hex(Uint8List bytes) {
    final buf = StringBuffer();
    for (final b in bytes) {
      final s = b.toRadixString(16);
      buf.write('${(s.length == 1) ? '0' : ''}$s');
    }
    return buf.toString();
  }

  static Uint8List hex2bin(String hexStr) {
    if (hexStr.length % 2 != 0) {
      throw const FormatException(
        'not an even number of hexadecimal characters',
      );
    }
    final result = Uint8List(hexStr.length ~/ 2);
    for (var i = 0; i < result.length; i++) {
      result[i] = int.parse(hexStr.substring(2 * i, 2 * (i + 1)), radix: 16);
    }
    return result;
  }

  static Uint8List getKeyBytes(String key, int size) {
    assert(size == 32 || size == 16, 'Key size must be 16 or 32');

    final temp = StringBuffer(key);
    while (temp.length < 32) {
      temp.write(key);
    }
    final cryptoKey =
        Uint8List.fromList(temp.toString().substring(0, 32).codeUnits);
    return cryptoKey;
  }

  static Uint8List encrypt(String key, Map<String, dynamic> jsonMap) {
    final cryptoKey = getKeyBytes(key, 32);
    final iv = cryptoKey.sublist(0, 16);

    final cbc = CBCBlockCipher(AESEngine())
      ..init(true, ParametersWithIV(KeyParameter(cryptoKey), iv));

    final jsonString = StringBuffer(json.encode(jsonMap));
    while (jsonString.length % 16 != 0) {
      jsonString.write(' ');
    }
    final paddedPlaintext = Uint8List.fromList(jsonString.toString().codeUnits);
    final cipherText = Uint8List(paddedPlaintext.length); // allocate space

    var offset = 0;
    while (offset < paddedPlaintext.length) {
      offset += cbc.processBlock(paddedPlaintext, offset, cipherText, offset);
    }

    return cipherText;
  }

  static Map<String, dynamic> decrypt(String key, Uint8List encryptedData) {
    final cryptoKey = getKeyBytes(key, 32);
    final iv = cryptoKey.sublist(0, 16);

    final cbc = CBCBlockCipher(AESEngine())
      ..init(false, ParametersWithIV(KeyParameter(cryptoKey), iv));

    final paddedPlaintext = Uint8List(encryptedData.length); // allocate space

    var offset = 0;
    while (offset < encryptedData.length) {
      offset +=
          cbc.processBlock(encryptedData, offset, paddedPlaintext, offset);
    }

    final plaintext = String.fromCharCodes(paddedPlaintext).trim();

    return Map<String, dynamic>.from(
      json.decode(plaintext) as Map<String, dynamic>,
    );
  }
}
