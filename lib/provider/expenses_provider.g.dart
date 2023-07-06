// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expenses_provider.dart';

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

String _$ExpensesHash() => r'0a837ffd1d2beb4bc88f03b5cbec27f383cbd0f9';

/// See also [Expenses].
class ExpensesProvider
    extends AutoDisposeAsyncNotifierProviderImpl<Expenses, List<Expense>> {
  ExpensesProvider(
    this.bookId,
  ) : super(
          () => Expenses()..bookId = bookId,
          from: expensesProvider,
          name: r'expensesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$ExpensesHash,
        );

  final String? bookId;

  @override
  bool operator ==(Object other) {
    return other is ExpensesProvider && other.bookId == bookId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, bookId.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  FutureOr<List<Expense>> runNotifierBuild(
    covariant _$Expenses notifier,
  ) {
    return notifier.build(
      bookId,
    );
  }
}

typedef ExpensesRef = AutoDisposeAsyncNotifierProviderRef<List<Expense>>;

/// See also [Expenses].
final expensesProvider = ExpensesFamily();

class ExpensesFamily extends Family<AsyncValue<List<Expense>>> {
  ExpensesFamily();

  ExpensesProvider call(
    String? bookId,
  ) {
    return ExpensesProvider(
      bookId,
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderImpl<Expenses, List<Expense>>
      getProviderOverride(
    covariant ExpensesProvider provider,
  ) {
    return call(
      provider.bookId,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'expensesProvider';
}

abstract class _$Expenses
    extends BuildlessAutoDisposeAsyncNotifier<List<Expense>> {
  late final String? bookId;

  FutureOr<List<Expense>> build(
    String? bookId,
  );
}
