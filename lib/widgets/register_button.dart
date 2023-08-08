import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpns42/l10n/l10n_extension.dart';

class RegisterButton extends ConsumerWidget {
  const RegisterButton({
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    super.key,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: () async {
        if (Form.of(context).validate()) {
          try {
            final userCredentials =
                await FirebaseAuth.instance.createUserWithEmailAndPassword(
              email: emailController.text,
              password: passwordController.text,
            );
            final user = userCredentials.user;
            if (user != null) {
              await Navigator.of(context).pushReplacementNamed('/sign_in');
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(context.t.registrationFailed)),
              );
            }
          } catch (e) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(context.t.registrationFailed)),
            );
          }
        }
      },
      child: Text(context.t.register),
    );
  }
}
