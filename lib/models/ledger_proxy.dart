import 'package:freezed_annotation/freezed_annotation.dart';

part 'ledger_proxy.freezed.dart';
part 'ledger_proxy.g.dart';

@freezed
class LedgerProxy with _$LedgerProxy {
  const factory LedgerProxy({
    required String id,
    required String title,
  }) = _LedgerProxy;

  factory LedgerProxy.fromJson(Map<String, dynamic> json) =>
      _$LedgerProxyFromJson(json);
}
