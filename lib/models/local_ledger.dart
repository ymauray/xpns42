// LocalLedger model with freezed

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nanoid/nanoid.dart';

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
    required String currency,
  }) = _LocalLedger;

  factory LocalLedger.create({
    required String title,
    required String firstPerson,
    required String secondPerson,
    required String currency,
    required String password,
  }) =>
      LocalLedger(
        title: title,
        firstPerson: firstPerson,
        secondPerson: secondPerson,
        shortCode: nanoid(6),
        password: password,
        currency: currency,
      );

  factory LocalLedger.fromJson(Map<String, dynamic> json) =>
      _$LocalLedgerFromJson(json);
}
