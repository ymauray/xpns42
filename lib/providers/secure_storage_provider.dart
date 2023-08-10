import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:xpns42/models/ledger_proxy.dart';

part 'secure_storage_provider.g.dart';

@riverpod
class SecureStorage extends _$SecureStorage {
  @override
  FlutterSecureStorage build() {
    return const FlutterSecureStorage(
      aOptions: AndroidOptions(
        encryptedSharedPreferences: true,
      ),
    );
  }

  Future<List<LedgerProxy>> getProxies() async {
    final storedAccounts = await state.read(key: 'accounts');
    final decodedAccounts =
        (jsonDecode(storedAccounts ?? '[]') as List<dynamic>)
            .map((e) => LedgerProxy.fromJson(e as Map<String, dynamic>))
            .toList();

    return decodedAccounts;
  }

  FutureOr<void> writeProxies(List<LedgerProxy> proxies) async {
    await state.write(
      key: 'accounts',
      value: jsonEncode(proxies),
    );
  }

  FutureOr<void> write({required String key, required String value}) async {
    await state.write(key: key, value: value);
  }
}
