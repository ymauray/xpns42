import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_registration_form/login_registration_form.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: ColoredBox(
        color: Color(0xFFa473cd),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 48),
            child: LoginRegistrationForm(
              title: Text(
                'Xpns42',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
              identifier: 'yannick',
            ),
          ),
        ),
      ),
    );
  }
}
