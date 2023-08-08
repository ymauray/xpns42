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
    //final profileRepository = ref.watch(profileRepositoryProvider);

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
              //final profile = await profileRepository.getProfile(user.uid);
              await Navigator.of(context)
                  .pushNamedAndRemoveUntil('/', (_) => true);
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
        }
      },
      child: Text(context.t.signIn),
    );
  }
}
