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
        if (emailController.text.isNotEmpty &&
            passwordController.text.isNotEmpty) {
          try {
            final userCredentials =
                await FirebaseAuth.instance.signInWithEmailAndPassword(
              email: emailController.text,
              password: passwordController.text,
            );
            final user = userCredentials.user;
            if (user != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Success')),
              );
              await Navigator.of(context).pushReplacementNamed('/');
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(context.t.authenticationFailed)),
              );
            }
          } catch (e) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(context.t.authenticationFailed)),
            );
            debugPrint(e.toString());
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(context.t.allFieldsRequired)),
          );
        }
      },
      child: Text(context.t.signIn),
    );
  }
}
