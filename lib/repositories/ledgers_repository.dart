import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:xpns42/models/ledger.dart';
import 'package:xpns42/repositories/base_repository.dart';

final class LedgersRepository extends BaseRepository {
  LedgersRepository._();
  static final LedgersRepository instance = LedgersRepository._();

  FutureOr<Ledger> c(Ledger ledger) async {
    final ledgerDBRef =
        FirebaseDatabase.instance.ref('/ledgers/${ledger.shortCode}');
    final encoder = init(ledger.shortCode, ledger.password);
    final encodedLedger = encoder.encryptLedger(ledger);
    await ledgerDBRef.set(encodedLedger.toJson());

    return ledger;
  }

  FutureOr<Ledger> u(Ledger ledger) async {
    final ledgerDBRef =
        FirebaseDatabase.instance.ref('/ledgers/${ledger.shortCode}');
    final encoder = init(ledger.shortCode, ledger.password);
    final encodedLedger = encoder.encryptLedger(ledger);
    await ledgerDBRef.update(encodedLedger.toJson());

    return ledger;
  }

  FutureOr<void> d(String shortCode) async {
    final ledgerDBRef = FirebaseDatabase.instance.ref('/ledgers/$shortCode');
    await ledgerDBRef.remove();
  }
}
