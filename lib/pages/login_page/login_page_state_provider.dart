import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:xpns42/pages/login_page/login_page_state.dart' as view;
import 'package:xpns42/pocketbase_util.dart';

part 'login_page_state_provider.g.dart';

@riverpod
class LoginPageState extends _$LoginPageState {
  @override
  view.LoginPageState build() {
    return const view.LoginPageState(
      showRegistrationForm: false,
    );
  }

  void toggleRegistrationForm() {
    state = state.copyWith(
      showRegistrationForm: !state.showRegistrationForm,
    );
  }

  FutureOr<bool> register({
    required String firstName,
    required String email,
    required String password,
  }) async {
    try {
      await pocketBaseInstance.collection('users').create(
        body: {
          'name': firstName,
          'username': email,
          'password': password,
          'passwordConfirm': password,
        },
      );

      return true;
    } on ClientException catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  FutureOr<bool> login({
    required String email,
    required String password,
  }) async {
    try {
      await pocketBaseInstance.collection('users').authWithPassword(
            email,
            password,
          );
      return true;
    } on ClientException catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }
}
