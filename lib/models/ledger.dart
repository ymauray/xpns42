import 'package:freezed_annotation/freezed_annotation.dart';

part 'ledger.freezed.dart';
part 'ledger.g.dart';

@freezed
class Ledger with _$Ledger {
  const factory Ledger({
    required String id,
    required String title,
    required String firstPerson,
    required String secondPerson,
    @Default(0.0) double balance,
    @Default(1) int references,
    @Default(9999) int sortOrder,
  }) = _Ledger;
  factory Ledger.fromJson(Map<String, dynamic> json) => _$LedgerFromJson(json);
}
