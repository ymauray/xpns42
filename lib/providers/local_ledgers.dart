import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:xpns42/models/ledger.dart';
import 'package:xpns42/models/local_ledger.dart';
import 'package:xpns42/providers/secure_storage.dart';
import 'package:xpns42/repositories/ledgers_repository.dart';

part 'local_ledgers.g.dart';

@riverpod
class LocalLedgers extends _$LocalLedgers with SecureStorage {
  @override
  FutureOr<List<LocalLedger>> build() async {
    return await readLocalLedgers();
  }

  // CRUD operations

  FutureOr<void> c(LocalLedger localLedger) async {
    final ledger = Ledger.fromLocalLedger(localLedger);
    LedgersRepository.instance.c(ledger);

    final localLedgers = state.value ?? [];
    await writeLocalLedgers(
      [...localLedgers, localLedger],
    );
    state = await AsyncValue.guard(readLocalLedgers);
  }

  FutureOr<void> u(LocalLedger localLedger) async {
    final ledger = Ledger.fromLocalLedger(localLedger);
    LedgersRepository.instance.u(ledger);

    final localLedgers = state.value ?? [];
    final updatedLedgers = [
      for (final l in localLedgers)
        if (l.shortCode == localLedger.shortCode) localLedger else l,
    ];

    await writeLocalLedgers(updatedLedgers);
    state = await AsyncValue.guard(readLocalLedgers);
  }

  FutureOr<void> d(LocalLedger localLedger) async {
    LedgersRepository.instance.d(localLedger.shortCode);

    final localLedgers = state.value ?? [];
    final updatedLedgers = localLedgers
        .where((l) => l.shortCode != localLedger.shortCode)
        .toList();

    await writeLocalLedgers(updatedLedgers);
    state = await AsyncValue.guard(readLocalLedgers);
  }
}
