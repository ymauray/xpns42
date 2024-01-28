// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$cryptoProviderHash() => r'd3f1aaa4471983a09547abf7931e014869339dea';

/// See also [cryptoProvider].
@ProviderFor(cryptoProvider)
final cryptoProviderProvider =
    AutoDisposeProvider<PointyCastleCryptoProvider>.internal(
  cryptoProvider,
  name: r'cryptoProviderProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$cryptoProviderHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CryptoProviderRef = AutoDisposeProviderRef<PointyCastleCryptoProvider>;
String _$secureRandomHash() => r'317f045deb5a0af23715bc9e75cc7483b2832b1c';

/// See also [secureRandom].
@ProviderFor(secureRandom)
final secureRandomProvider = AutoDisposeProvider<SecureRandom>.internal(
  secureRandom,
  name: r'secureRandomProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$secureRandomHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SecureRandomRef = AutoDisposeProviderRef<SecureRandom>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
