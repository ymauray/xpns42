import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:xpns42/models/ledger.dart';
import 'package:xpns42/repositories/ledger_repository.dart';

part 'ledgers_provider.g.dart';

@riverpod
class Ledgers extends _$Ledgers {
  @override
  FutureOr<List<Ledger>> build(String groupId) async {
    return await LedgerRepository.listLedgers(groupId);
  }

  FutureOr<void> createLedger({
    required String title,
    required String groupId,
    required String firstPerson,
    required String secondPerson,
  }) async {
    await LedgerRepository.createLedger(
      title: title,
      groupId: groupId,
      firstPerson: firstPerson,
      secondPerson: secondPerson,
    );
    state = await AsyncValue.guard(() => LedgerRepository.listLedgers(groupId));
  }

  FutureOr<void> remove(Ledger ledger) async {
    final updatedLedger = ledger.copyWith(references: ledger.references - 1);
    if (updatedLedger.references > 0) {
      await LedgerRepository.updateLedger(updatedLedger);
    } else {
      await LedgerRepository.deleteLedger(ledger);
    }
    state = await AsyncValue.guard(
      () => LedgerRepository.listLedgers(groupId),
    );
  }

  FutureOr<void> reorder() async {
    state = await AsyncValue.guard(() async {
      final ledgers = state.value ?? [];
      for (var i = 0; i < ledgers.length; i++) {
        ledgers[i] = ledgers[i].copyWith(sortOrder: i);
      }
      for (var i = 0; i < ledgers.length; i++) {
        await LedgerRepository.updateLedger(ledgers[i]);
      }
      return ledgers;
    });
  }
}
