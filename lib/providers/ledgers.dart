import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:xpns42/models/ledger.dart';
import 'package:xpns42/models/ledger_proxy.dart';
import 'package:xpns42/providers/secure_storage_provider.dart';
import 'package:xpns42/repositories/ledger_repository.dart';

part 'ledgers.g.dart';

@riverpod
class Ledgers extends _$Ledgers {
  @override
  FutureOr<List<LedgerProxy>> build() async {
    return await _loadProxies();
  }

  FutureOr<List<LedgerProxy>> _loadProxies() async {
    final secureStorage = ref.read(secureStorageProvider.notifier);
    return await secureStorage.getProxies();
  }

  FutureOr<Ledger> addLedger({
    required String title,
    required String firstPerson,
    required String secondPerson,
    required String password,
  }) async {
    state = const AsyncValue.loading();

    final ledger = await ref.read(ledgerRepositoryProvider).createLedger(
          title: title,
          firstPerson: firstPerson,
          secondPerson: secondPerson,
          password: password,
        );

    state = await AsyncValue.guard(() async {
      final secureStorage = ref.read(secureStorageProvider.notifier);
      await secureStorage.write(
        key: 'accountKey',
        value: password,
      );

      final proxies = await secureStorage.getProxies();
      proxies.add(LedgerProxy(id: ledger.id, title: title));

      await secureStorage.writeProxies(proxies);

      return await _loadProxies();
    });

    return ledger;
  }

  FutureOr<void> deleteLedger(String id) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final secureStorage = ref.read(secureStorageProvider.notifier);
      final proxies = await secureStorage.getProxies();
      proxies.removeWhere((proxy) => proxy.id == id);
      await secureStorage.writeProxies(proxies);

      await ref.read(ledgerRepositoryProvider).deleteLedger(id);

      return await _loadProxies();
    });
  }
}
