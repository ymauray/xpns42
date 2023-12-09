import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:xpns42/models/local_ledger.dart';

part 'ledger.freezed.dart';
part 'ledger.g.dart';

@freezed
class Ledger with _$Ledger {
  const factory Ledger({
    required String title,
    required String firstPerson,
    required String secondPerson,
    required String shortCode,
    required String password,
    required String currency,
  }) = _Ledger;

  factory Ledger.fromLocalLedger(LocalLedger localLedger) => Ledger(
        title: localLedger.title,
        firstPerson: localLedger.firstPerson,
        secondPerson: localLedger.secondPerson,
        shortCode: localLedger.shortCode,
        password: localLedger.password,
        currency: localLedger.currency,
      );

  factory Ledger.fromJson(Map<String, dynamic> json) => _$LedgerFromJson(json);
}
