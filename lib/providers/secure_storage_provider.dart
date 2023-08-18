import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:xpns42/models/ledger_proxy.dart';

part 'secure_storage_provider.g.dart';

@riverpod
class SecureStorage extends _$SecureStorage {
  @override
  FlutterSecureStorage build() {
    return const FlutterSecureStorage();
  }

  Future<List<LedgerProxy>> getProxies() async {
    final storedAccounts = await state.read(key: 'accounts');
    final decodedAccounts =
        (jsonDecode(storedAccounts ?? '[]') as List<dynamic>)
            .map((e) => LedgerProxy.fromJson(e as Map<String, dynamic>))
            .toList();

    return decodedAccounts;
  }

  Future<void> setProxies(List<LedgerProxy> proxies) async {
    proxies.sort((a, b) => a.title.compareTo(b.title));
    final jsonEncoded = jsonEncode(proxies);
    await state.write(key: 'accounts', value: null);
    await state.write(key: 'accounts', value: jsonEncoded);
  }
}
