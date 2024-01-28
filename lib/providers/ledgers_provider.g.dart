// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ledgers_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$ledgersHash() => r'9a793d1b15c0e1e76d0371f9f0b5b917463f3599';

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

abstract class _$Ledgers
    extends BuildlessAutoDisposeAsyncNotifier<List<Ledger>> {
  late final String groupId;

  FutureOr<List<Ledger>> build(
    String groupId,
  );
}

/// See also [Ledgers].
@ProviderFor(Ledgers)
const ledgersProvider = LedgersFamily();

/// See also [Ledgers].
class LedgersFamily extends Family<AsyncValue<List<Ledger>>> {
  /// See also [Ledgers].
  const LedgersFamily();

  /// See also [Ledgers].
  LedgersProvider call(
    String groupId,
  ) {
    return LedgersProvider(
      groupId,
    );
  }

  @override
  LedgersProvider getProviderOverride(
    covariant LedgersProvider provider,
  ) {
    return call(
      provider.groupId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'ledgersProvider';
}

/// See also [Ledgers].
class LedgersProvider
    extends AutoDisposeAsyncNotifierProviderImpl<Ledgers, List<Ledger>> {
  /// See also [Ledgers].
  LedgersProvider(
    String groupId,
  ) : this._internal(
          () => Ledgers()..groupId = groupId,
          from: ledgersProvider,
          name: r'ledgersProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$ledgersHash,
          dependencies: LedgersFamily._dependencies,
          allTransitiveDependencies: LedgersFamily._allTransitiveDependencies,
          groupId: groupId,
        );

  LedgersProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.groupId,
  }) : super.internal();

  final String groupId;

  @override
  FutureOr<List<Ledger>> runNotifierBuild(
    covariant Ledgers notifier,
  ) {
    return notifier.build(
      groupId,
    );
  }

  @override
  Override overrideWith(Ledgers Function() create) {
    return ProviderOverride(
      origin: this,
      override: LedgersProvider._internal(
        () => create()..groupId = groupId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        groupId: groupId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<Ledgers, List<Ledger>>
      createElement() {
    return _LedgersProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LedgersProvider && other.groupId == groupId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, groupId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin LedgersRef on AutoDisposeAsyncNotifierProviderRef<List<Ledger>> {
  /// The parameter `groupId` of this provider.
  String get groupId;
}

class _LedgersProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<Ledgers, List<Ledger>>
    with LedgersRef {
  _LedgersProviderElement(super.provider);

  @override
  String get groupId => (origin as LedgersProvider).groupId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
