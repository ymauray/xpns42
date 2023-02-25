import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_registration_form/src/form_content.dart';
import 'package:login_registration_form/src/form_title.dart';

class LoginRegistrationForm extends ConsumerWidget {
  const LoginRegistrationForm({
    required this.title,
    this.identifier,
    super.key,
  });

  final Widget title;
  final String? identifier;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FormTitle(title: title),
        FormContent(identifier: identifier),
      ],
    );
  }
}
