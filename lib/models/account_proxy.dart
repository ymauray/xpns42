import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_proxy.freezed.dart';
part 'account_proxy.g.dart';

@freezed
class AccountProxy with _$AccountProxy {
  const factory AccountProxy({
    required String id,
    required String title,
  }) = _AccountProxy;

  factory AccountProxy.fromJson(Map<String, dynamic> json) =>
      _$AccountProxyFromJson(json);
}
