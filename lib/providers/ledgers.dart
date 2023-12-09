import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:xpns42/models/ledger.dart';
import 'package:xpns42/providers/secure_storage_provider.dart';
import 'package:xpns42/repositories/ledger_repository.dart';

part 'ledgers.g.dart';

@riverpod
class Ledgers extends _$Ledgers {
  @override
  Future<List<Ledger>> build() async {
    return [];
  }

  // CRUD operations

  FutureOr<void> deleteLedger(String id) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final secureStorage = ref.read(secureStorageProvider.notifier);
      final proxies = await secureStorage.getLedgers();
      await secureStorage.setLedgers(proxies);

      await ref.read(ledgerRepositoryProvider).deleteLedger(id);

      return await secureStorage.getLedgers();
    });
  }

  //Future<void> add(Ledger ledger) async {
  //  state = const AsyncValue.loading();
  //  state = await AsyncValue.guard(() async {
  //    final secureStorage = ref.read(secureStorageProvider.notifier);
  //    final ledgers = await secureStorage.getLedgers();
  //    await secureStorage.setLedgers(
  //      [
  //        ...ledgers,
  //        Ledger(
  //          title: ledger.title,
  //          firstPerson: ledger.firstPerson,
  //          secondPerson: ledger.secondPerson,
  //        ),
  //      ],
  //    );

  //    return await secureStorage.getLedgers();
  //  });
  //}
}
