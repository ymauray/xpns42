import 'package:firebase_auth/firebase_auth.dart';
import 'package:nanoid/nanoid.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:xpns42/models/ledger.dart';
import 'package:xpns42/providers/secure_storage_provider.dart';
import 'package:xpns42/repositories/ledger_repository.dart';

part 'ledgers.g.dart';

@riverpod
class Ledgers extends _$Ledgers {
  @override
  Future<List<Ledger>> build() async {
    final user = FirebaseAuth.instance.currentUser;

    final ledgerRepository = ref.read(ledgerRepositoryProvider);
    final ledgerIds = await ledgerRepository.loadUserLedgers(userId: user!.uid);
    final secureStorage = ref.read(secureStorageProvider.notifier);
    final proxies = await secureStorage.getLedgers();
    final updatedProxies = <Ledger>[];

    for (final proxyLedger in proxies) {
      if (ledgerIds.contains(proxyLedger.shortCode)) {
        updatedProxies.add(proxyLedger.copyWith(known: true));
      } else {
        updatedProxies.add(proxyLedger.copyWith());
      }
    }

    return updatedProxies;
  }

  FutureOr<Ledger> addLedger({
    required String title,
    required String firstPerson,
    required String secondPerson,
    required String password,
  }) async {
    state = const AsyncValue.loading();

    final shortCode = nanoid(6);

    final ledger = Ledger(
      title: title,
      firstPerson: firstPerson,
      secondPerson: secondPerson,
      shortCode: shortCode,
    );

    await ref
        .read(ledgerRepositoryProvider)
        .createLedger(ledger: ledger, password: password);

    state = await AsyncValue.guard(() async {
      final secureStorage = ref.read(secureStorageProvider.notifier);
      final proxies = await secureStorage.getLedgers();
      proxies.add(ledger);
      await secureStorage.setLedgers(proxies);

      return await secureStorage.getLedgers();
    });

    return ledger;
  }

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
