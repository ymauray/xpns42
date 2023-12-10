import 'dart:async';
import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:xpns42/models/local_ledger.dart';

mixin SecureStorage {
  final _key = 'local_ledgers';

  Future<List<LocalLedger>> readLocalLedgers() async {
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

  FutureOr<void> writeLocalLedgers(List<LocalLedger> localLedgers) async {
    const secureStorage = FlutterSecureStorage();
    await secureStorage.write(
      key: _key,
      value: jsonEncode(localLedgers.map((e) => e.toJson()).toList()),
    );
    return null;
  }
}
