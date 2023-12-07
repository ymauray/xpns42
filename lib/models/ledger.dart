import 'package:freezed_annotation/freezed_annotation.dart';

part 'ledger.freezed.dart';
part 'ledger.g.dart';

@freezed
class Ledger with _$Ledger {
  const factory Ledger({
    required String title,
    required String firstPerson,
    required String secondPerson,
    required String shortCode,
    String? password,
    @Default(true) bool locked,
    @Default(false) bool known,
  }) = _Ledger;

  factory Ledger.fromJson(Map<String, dynamic> json) => _$LedgerFromJson(json);
}
