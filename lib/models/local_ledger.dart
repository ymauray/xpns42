// LocalLedger model with freezed

import 'package:freezed_annotation/freezed_annotation.dart';

part 'local_ledger.freezed.dart';
part 'local_ledger.g.dart';

@freezed
class LocalLedger with _$LocalLedger {
  const factory LocalLedger({
    required String title,
    required String firstPerson,
    required String secondPerson,
    required String shortCode,
    required String password,
  }) = _LocalLedger;

  factory LocalLedger.fromJson(Map<String, dynamic> json) =>
      _$LocalLedgerFromJson(json);
}
