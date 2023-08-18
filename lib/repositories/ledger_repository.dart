import 'package:firebase_database/firebase_database.dart';
import 'package:nanoid/nanoid.dart';
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

  FutureOr<Ledger> createLedger({
    required String title,
    required String firstPerson,
    required String secondPerson,
    required String password,
  }) async {
    final accountsDBRef = FirebaseDatabase.instance.ref('/ledgers');
    final ledgerDBRef = accountsDBRef.push();

    final encoder = init(ledgerDBRef.key!, password);

    final ledger = Ledger(
      id: ledgerDBRef.key!,
      shortCode: nanoid(6),
      encryptedId: encoder.encrypt(ledgerDBRef.key!),
      title: encoder.encrypt(title),
      firstPerson: encoder.encrypt(firstPerson),
      secondPerson: encoder.encrypt(secondPerson),
    );

    await ledgerDBRef.set(ledger.toJson());

    final unlocked = await _decryptLedger(ledger, password);

    return unlocked!;
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
    final encoder = init(lockedLedger.id, password);

    final decryptedId = encoder.decrypt(lockedLedger.encryptedId!);
    if (decryptedId == lockedLedger.id) {
      return Ledger(
        id: lockedLedger.id,
        shortCode: lockedLedger.shortCode,
        encryptedId: lockedLedger.encryptedId,
        title: encoder.decrypt(lockedLedger.title)!,
        firstPerson: encoder.decrypt(lockedLedger.firstPerson)!,
        secondPerson: encoder.decrypt(lockedLedger.secondPerson)!,
      );
    }
    return null;
  }
}
