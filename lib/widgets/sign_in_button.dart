import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpns42/l10n/l10n_extension.dart';

class SignInButton extends ConsumerWidget {
  const SignInButton({
    required this.emailController,
    required this.passwordController,
    super.key,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: () async {
        if (Form.of(context).validate()) {
          try {
            final userCredentials =
                await FirebaseAuth.instance.signInWithEmailAndPassword(
              email: emailController.text,
              password: passwordController.text,
            );
            final user = userCredentials.user;
            if (user != null) {
              await Navigator.of(context)
                  .pushNamedAndRemoveUntil('/', (_) => false);
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(context.t.authenticationFailed)),
              );
            }
          } catch (e) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(context.t.authenticationFailed)),
            );
          }
        }
      },
      child: Text(context.t.continueWithAnEmail),
    );
  }
}
