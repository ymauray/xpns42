import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_page_state.freezed.dart';
part 'login_page_state.g.dart';

@freezed
class LoginPageState with _$LoginPageState {
  const factory LoginPageState({
    required bool showRegistrationForm,
    String? firstName,
    String? email,
    String? password,
  }) = _LoginPageState;
  factory LoginPageState.fromJson(Map<String, dynamic> json) =>
      _$LoginPageStateFromJson(json);
}
