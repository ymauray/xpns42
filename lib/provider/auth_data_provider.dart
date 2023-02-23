// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:xpns42/model/auth_data.dart';

part 'auth_data_provider.g.dart';

@riverpod
class AuthDataController extends _$AuthDataController {
  @override
  AuthData build() {
    return const AuthData(
      username: '',
      password: '',
      isRegistrationForm: false,
    );
  }

  bool get registrationForm => state.isRegistrationForm;
  set registrationForm(bool value) {
    state = state.copyWith(isRegistrationForm: !state.isRegistrationForm);
  }
}
