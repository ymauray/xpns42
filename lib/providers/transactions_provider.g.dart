// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transactions_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$transactionsHash() => r'43f3d7a1073dffeaeb5bf0f4b0a3981f09f88db1';

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

abstract class _$Transactions
    extends BuildlessAutoDisposeAsyncNotifier<List<Transaction>> {
  late final String groupId;

  FutureOr<List<Transaction>> build(
    String groupId,
  );
}

/// See also [Transactions].
@ProviderFor(Transactions)
const transactionsProvider = TransactionsFamily();

/// See also [Transactions].
class TransactionsFamily extends Family<AsyncValue<List<Transaction>>> {
  /// See also [Transactions].
  const TransactionsFamily();

  /// See also [Transactions].
  TransactionsProvider call(
    String groupId,
  ) {
    return TransactionsProvider(
      groupId,
    );
  }

  @override
  TransactionsProvider getProviderOverride(
    covariant TransactionsProvider provider,
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
  String? get name => r'transactionsProvider';
}

/// See also [Transactions].
class TransactionsProvider extends AutoDisposeAsyncNotifierProviderImpl<
    Transactions, List<Transaction>> {
  /// See also [Transactions].
  TransactionsProvider(
    String groupId,
  ) : this._internal(
          () => Transactions()..groupId = groupId,
          from: transactionsProvider,
          name: r'transactionsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$transactionsHash,
          dependencies: TransactionsFamily._dependencies,
          allTransitiveDependencies:
              TransactionsFamily._allTransitiveDependencies,
          groupId: groupId,
        );

  TransactionsProvider._internal(
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
  FutureOr<List<Transaction>> runNotifierBuild(
    covariant Transactions notifier,
  ) {
    return notifier.build(
      groupId,
    );
  }

  @override
  Override overrideWith(Transactions Function() create) {
    return ProviderOverride(
      origin: this,
      override: TransactionsProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<Transactions, List<Transaction>>
      createElement() {
    return _TransactionsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TransactionsProvider && other.groupId == groupId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, groupId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TransactionsRef
    on AutoDisposeAsyncNotifierProviderRef<List<Transaction>> {
  /// The parameter `groupId` of this provider.
  String get groupId;
}

class _TransactionsProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<Transactions,
        List<Transaction>> with TransactionsRef {
  _TransactionsProviderElement(super.provider);

  @override
  String get groupId => (origin as TransactionsProvider).groupId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
