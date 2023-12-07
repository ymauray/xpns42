import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:xpns42/models/ledger.dart';

part 'secure_storage_provider.g.dart';

@riverpod
class SecureStorage extends _$SecureStorage {
  @override
  FlutterSecureStorage build() {
    return const FlutterSecureStorage();
  }

  Future<List<Ledger>> getLedgers() async {
    final storedLedgers = await state.read(key: 'ledgers');
    final decodedLedgers = (jsonDecode(storedLedgers ?? '[]') as List<dynamic>)
        .map((e) => Ledger.fromJson(e as Map<String, dynamic>))
        .toList();

    return decodedLedgers;
  }

  Future<void> setLedgers(List<Ledger> proxies) async {
    proxies.sort((a, b) => a.title.compareTo(b.title));
    final jsonEncoded = jsonEncode(proxies);
    await state.write(key: 'ledgers', value: null);
    await state.write(key: 'ledgers', value: jsonEncoded);
  }

  Future<void> clear() async {
    await state.deleteAll();
  }
}
