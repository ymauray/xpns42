import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:xpns42/models/local_ledger.dart';

part 'local_ledgers.g.dart';

@riverpod
class LocalLedgers extends _$LocalLedgers {
  @override
  FutureOr<List<LocalLedger>> build() async {
    return await _readLocalLedgers();
  }

  Future<List<LocalLedger>> _readLocalLedgers() async {
    const secureStorage = FlutterSecureStorage();
    final fromStorage = await secureStorage.read(key: 'local_ledgers');
    if (fromStorage != null) {
      final decodedLedgers = (jsonDecode(fromStorage) as List<dynamic>)
          .map((e) => LocalLedger.fromJson(e as Map<String, dynamic>))
          .toList();

      return decodedLedgers;
    }
    return const [];
  }
}
