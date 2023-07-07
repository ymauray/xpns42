import 'dart:convert';
import 'dart:typed_data';

import 'package:pointycastle/export.dart';
import 'package:pointycastle/pointycastle.dart';
// ignore: implementation_imports
import 'package:pointycastle/src/platform_check/platform_check.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'crypto_provider.g.dart';

abstract class ICryptoProvider {
  AsymmetricKeyPair<RSAPublicKey, RSAPrivateKey> generateKeys({
    int bitLength = 2048,
  });

  String encodePublicKeyToPemPKCS1(RSAPublicKey publicKey);

  String encodePrivateKeyToPemPKCS1(RSAPrivateKey privateKey);

  RSAPublicKey decodePublicKeyFromPemPKCS1(String publicKeyString);

  RSAPrivateKey decodePrivateKeyFromPemPKCS1(String privateKeyString);

  String sign(String plainText, RSAPrivateKey privateKey);

  bool verify(String signedMessage, String message, RSAPublicKey publicKey);
}

class PointyCastleCryptoProvider implements ICryptoProvider {
  PointyCastleCryptoProvider(this.secureRandom);

  final SecureRandom secureRandom;

  @override
  AsymmetricKeyPair<RSAPublicKey, RSAPrivateKey> generateKeys({
    int bitLength = 2048,
  }) {
    final keyGen = RSAKeyGenerator()
      ..init(
        ParametersWithRandom(
          RSAKeyGeneratorParameters(
            BigInt.parse('65537'),
            bitLength,
            64,
          ),
          secureRandom,
        ),
      );

    final pair = keyGen.generateKeyPair();

    final myPublicKey = pair.publicKey as RSAPublicKey;
    final myPrivateKey = pair.privateKey as RSAPrivateKey;

    return AsymmetricKeyPair<RSAPublicKey, RSAPrivateKey>(
      myPublicKey,
      myPrivateKey,
    );
  }

  @override
  String encodePublicKeyToPemPKCS1(RSAPublicKey publicKey) {
    final topLevel = ASN1Sequence()
      ..add(ASN1Integer(publicKey.modulus))
      ..add(ASN1Integer(publicKey.exponent));

    final dataBase64 = base64.encode(topLevel.encode().toList());

    return '''
-----BEGIN PUBLIC KEY-----
$dataBase64
-----END PUBLIC KEY-----
''';
  }

  @override
  String encodePrivateKeyToPemPKCS1(RSAPrivateKey privateKey) {
    final topLevel = ASN1Sequence();

    final version = ASN1Integer(BigInt.from(0));
    final modulus = ASN1Integer(privateKey.n);
    final publicExponent = ASN1Integer(privateKey.exponent);
    final privateExponent = ASN1Integer(privateKey.d);
    final p = ASN1Integer(privateKey.p);
    final q = ASN1Integer(privateKey.q);
    final dP = privateKey.privateExponent! % (privateKey.p! - BigInt.from(1));
    final exp1 = ASN1Integer(dP);
    final dQ = privateKey.privateExponent! % (privateKey.q! - BigInt.from(1));
    final exp2 = ASN1Integer(dQ);
    final iQ = privateKey.q!.modInverse(privateKey.p!);
    final co = ASN1Integer(iQ);

    topLevel
      ..add(version)
      ..add(modulus)
      ..add(publicExponent)
      ..add(privateExponent)
      ..add(p)
      ..add(q)
      ..add(exp1)
      ..add(exp2)
      ..add(co);

    final dataBase64 = base64.encode(topLevel.encode().toList());

    return '''
-----BEGIN PRIVATE KEY-----
$dataBase64
-----END PRIVATE KEY-----
''';
  }

  @override
  RSAPublicKey decodePublicKeyFromPemPKCS1(String publicKeyString) {
    final keyString = publicKeyString.split('\n')[1];
    final topLevel = ASN1Sequence.fromBytes(base64.decode(keyString));
    final modulus = topLevel.elements![0] as ASN1Integer;
    final exponent = topLevel.elements![1] as ASN1Integer;
    final publicKey = RSAPublicKey(modulus.integer!, exponent.integer!);

    return publicKey;
  }

  @override
  RSAPrivateKey decodePrivateKeyFromPemPKCS1(String privateKeyString) {
    final keyString = privateKeyString.split('\n')[1];
    final topLevel = ASN1Sequence.fromBytes(base64.decode(keyString));
    final modulus = topLevel.elements![1] as ASN1Integer;
    final privateExponent = topLevel.elements![3] as ASN1Integer;
    final p = topLevel.elements![4] as ASN1Integer;
    final q = topLevel.elements![5] as ASN1Integer;
    final privateKey = RSAPrivateKey(
      modulus.integer!,
      privateExponent.integer!,
      p.integer,
      q.integer,
    );

    return privateKey;
  }

  @override
  String sign(String plainText, RSAPrivateKey privateKey) {
    final signer = RSASigner(SHA256Digest(), '0609608648016503040201')
      ..init(true, PrivateKeyParameter<RSAPrivateKey>(privateKey));

    return base64Encode(
      signer.generateSignature(Uint8List.fromList(plainText.codeUnits)).bytes,
    );
  }

  @override
  bool verify(String signedMessage, String message, RSAPublicKey publicKey) {
    final signer = RSASigner(SHA256Digest(), '0609608648016503040201')
      ..init(false, PublicKeyParameter<RSAPublicKey>(publicKey));

    return signer.verifySignature(
      Uint8List.fromList(message.codeUnits),
      RSASignature(base64Decode(signedMessage)),
    );
  }
}

@riverpod
ICryptoProvider crypto(CryptoRef ref) {
  final secureRandom = ref.read(secureRandomProvider);

  return PointyCastleCryptoProvider(secureRandom);
}

@riverpod
SecureRandom secureRandom(SecureRandomRef ref) {
  return FortunaRandom()
    ..seed(
      KeyParameter(Platform.instance.platformEntropySource().getBytes(32)),
    );
}
