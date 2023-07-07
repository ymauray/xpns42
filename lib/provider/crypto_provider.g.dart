// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// ignore_for_file: avoid_private_typedef_functions, non_constant_identifier_names, subtype_of_sealed_class, invalid_use_of_internal_member, unused_element, constant_identifier_names, unnecessary_raw_strings, library_private_types_in_public_api

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

String _$cryptoHash() => r'99445b1975c0c22d3435aa5f1c7cbc7bde910588';

/// See also [crypto].
final cryptoProvider = AutoDisposeProvider<ICryptoProvider>(
  crypto,
  name: r'cryptoProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$cryptoHash,
);
typedef CryptoRef = AutoDisposeProviderRef<ICryptoProvider>;
String _$secureRandomHash() => r'317f045deb5a0af23715bc9e75cc7483b2832b1c';

/// See also [secureRandom].
final secureRandomProvider = AutoDisposeProvider<SecureRandom>(
  secureRandom,
  name: r'secureRandomProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$secureRandomHash,
);
typedef SecureRandomRef = AutoDisposeProviderRef<SecureRandom>;
