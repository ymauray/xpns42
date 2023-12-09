import 'package:firebase_database/firebase_database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:xpns42/models/ledger.dart';
import 'package:xpns42/repositories/base_repository.dart';

part 'ledger_repository.g.dart';

@riverpod
LedgerRepository ledgerRepository(LedgerRepositoryRef ref) {
  return LedgerRepository(ledgerRepositoryRef: ref);
}

final class LedgerRepository extends BaseRepository {
  LedgerRepository({
    required this.ledgerRepositoryRef,
  });

  final LedgerRepositoryRef ledgerRepositoryRef;

  // Public API

  // List available ledgers
  FutureOr<List<Ledger>> list() async {
    final accountsDBRef = FirebaseDatabase.instance.ref('/ledgers');
    final event = await accountsDBRef.once();

    final ledgers = <Ledger>[];
    if (event.snapshot.exists) {
      final value =
          (event.snapshot.value as Map<dynamic, dynamic>).values.toList();
      for (final ledger in value) {}
    }

    return ledgers;
  }

  /// Load a ledger from id and password.
  ///
  /// Returns null if ledger does not exist or password is incorrect.
  Future<Ledger?> load(String id, String password) async {
    final ledgerDBRef = FirebaseDatabase.instance.ref('/ledgers/$id');
    final snapshot = await ledgerDBRef.get();
    if (snapshot.exists) {
      final encryptedLedger =
          await _loadLedger(snapshot.value as Map<dynamic, dynamic>);
      final decryptedLedger = await _decryptLedger(encryptedLedger, password);
      if (decryptedLedger != null) {
        return decryptedLedger;
      }
    }

    return null;
  }

  Future<Ledger?> importLedger({
    required String code,
    required String password,
  }) async {
    final encryptedLedger = await _loadLedgerFromCode(code);
    if (encryptedLedger == null) return null;

    final decryptedLedger = await _decryptLedger(encryptedLedger, password);
    if (decryptedLedger == null) return null;

    return decryptedLedger;
  }

  // Private methods

  FutureOr<List<String>> loadUserLedgers({
    required String userId,
  }) async {
    final userLedgersDBRef =
        FirebaseDatabase.instance.ref('/persons/$userId/ledgers');

    final userLedgers = await userLedgersDBRef.get();
    if (userLedgers.exists) {
      final ledgerIds = List<String>.from(
        (userLedgers.value as Map<dynamic, dynamic>).keys.toList(),
      );
      return ledgerIds;
    }

    return [];
  }

  FutureOr<void> deleteLedger(String id) async {
    final accountsDBRef = FirebaseDatabase.instance.ref('/ledgers');
    final ledgerDBRef = accountsDBRef.child(id);

    await ledgerDBRef.remove();
  }

  FutureOr<bool> checkLedgerExists(String id) async {
    final accountDBRef = FirebaseDatabase.instance.ref('/ledgers/$id');
    final snapshot = await accountDBRef.get();
    return snapshot.exists;
  }

  FutureOr<Ledger?> _loadLedgerFromCode(String code) async {
    final accountsDBRef = FirebaseDatabase.instance.ref('/ledgers');
    final event = await accountsDBRef
        .orderByChild('shortCode')
        .equalTo(code)
        .limitToFirst(1)
        .once();

    if (event.snapshot.exists) {
      final value =
          (event.snapshot.value as Map<dynamic, dynamic>).values.first;
      return _loadLedger(value as Map<dynamic, dynamic>);
    }

    return null;
  }

  FutureOr<Ledger> _loadLedger(Map<dynamic, dynamic> data) async {
    final jsonMap = Map<String, dynamic>.from(data);
    final ledger = Ledger.fromJson(jsonMap);

    return ledger;
  }

  FutureOr<Ledger?> _decryptLedger(Ledger lockedLedger, String password) async {
    return null;
  }
}
