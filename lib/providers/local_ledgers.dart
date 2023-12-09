import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:xpns42/models/ledger.dart';
import 'package:xpns42/models/local_ledger.dart';
import 'package:xpns42/repositories/ledgers_repository.dart';

part 'local_ledgers.g.dart';

@riverpod
class LocalLedgers extends _$LocalLedgers {
  final _key = 'local_ledgers';

  @override
  FutureOr<List<LocalLedger>> build() async {
    return await _readLocalLedgers();
  }

  Future<List<LocalLedger>> _readLocalLedgers() async {
    const secureStorage = FlutterSecureStorage();
    final fromStorage = await secureStorage.read(key: _key);
    if (fromStorage != null) {
      final localLedgers = (jsonDecode(fromStorage) as List<dynamic>)
          .map((e) => LocalLedger.fromJson(e as Map<String, dynamic>))
          .toList();

      return localLedgers;
    }
    return const [];
  }

  FutureOr<void> _writeLocalLedgers(List<LocalLedger> localLedgers) async {
    const secureStorage = FlutterSecureStorage();
    await secureStorage.write(
      key: _key,
      value: jsonEncode(localLedgers.map((e) => e.toJson()).toList()),
    );
  }

  // CRUD operations

  FutureOr<void> c(LocalLedger localLedger) async {
    final ledger = Ledger.fromLocalLedger(localLedger);
    LedgersRepository.instance.c(ledger);

    final localLedgers = state.value ?? [];
    await _writeLocalLedgers(
      [...localLedgers, localLedger],
    );
    state = await AsyncValue.guard(_readLocalLedgers);
  }

  FutureOr<void> u(LocalLedger localLedger) async {
    final ledger = Ledger.fromLocalLedger(localLedger);
    LedgersRepository.instance.u(ledger);

    final localLedgers = state.value ?? [];
    final updatedLedgers = [
      for (final l in localLedgers)
        if (l.shortCode == localLedger.shortCode) localLedger else l,
    ];

    await _writeLocalLedgers(updatedLedgers);
    state = await AsyncValue.guard(_readLocalLedgers);
  }

  FutureOr<void> d(LocalLedger localLedger) async {
    LedgersRepository.instance.d(localLedger.shortCode);

    final localLedgers = state.value ?? [];
    final updatedLedgers = localLedgers
        .where((l) => l.shortCode != localLedger.shortCode)
        .toList();

    await _writeLocalLedgers(updatedLedgers);
    state = await AsyncValue.guard(_readLocalLedgers);
  }
}
