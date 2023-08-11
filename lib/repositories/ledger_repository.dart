import 'package:firebase_database/firebase_database.dart';
import 'package:nanoid/nanoid.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:xpns42/models/ledger.dart';
import 'package:xpns42/providers/secure_storage_provider.dart';
import 'package:xpns42/repositories/base_repository.dart';

part 'ledger_repository.g.dart';

final class LedgerRepository extends BaseRepository {
  LedgerRepository({
    required this.ledgerRepositoryRef,
  });

  final LedgerRepositoryRef ledgerRepositoryRef;

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

    final unlocked = await unlockLedger(ledger, password);

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

  FutureOr<Ledger?> loadLedger(String id) async {
    final accountDBRef = FirebaseDatabase.instance.ref('/ledgers/$id');
    final snapshot = await accountDBRef.get();
    if (snapshot.exists) {
      return _loadLedger(snapshot.value as Map<dynamic, dynamic>);
    }

    return null;
  }

  FutureOr<Ledger?> loadLedgerFromCode(String code) async {
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

  FutureOr<Ledger?> unlockLedger(Ledger lockedLedger, String password) async {
    final encoder = init(lockedLedger.id, password);

    final decryptedId = encoder.decrypt(lockedLedger.encryptedId);
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

  FutureOr<Ledger?> importLedger({
    required String code,
    required String password,
  }) async {
    final ledger = await loadLedgerFromCode(code);
    if (ledger == null) return null;

    final unlocked = await unlockLedger(ledger, password);
    if (unlocked == null) return null;

    final secureStorage =
        ledgerRepositoryRef.read(secureStorageProvider.notifier);
    await secureStorage.write(
      key: 'accountKey',
      value: password,
    );

    return unlocked;
  }
}

@riverpod
LedgerRepository ledgerRepository(LedgerRepositoryRef ref) {
  return LedgerRepository(ledgerRepositoryRef: ref);
}
