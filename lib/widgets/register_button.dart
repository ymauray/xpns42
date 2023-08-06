import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpns42/l10n/l10n_extension.dart';
import 'package:xpns42/models/profile.dart';
import 'package:xpns42/providers/crypto_provider.dart';
import 'package:xpns42/providers/secure_storage_provider.dart';
import 'package:xpns42/repositories/profile_repository.dart';

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
    final crypto = ref.watch(cryptoProvider);
    final secureStorage = ref.watch(secureStorageProvider.notifier);
    final profileRepository = ref.watch(profileRepositoryProvider);

    return ElevatedButton(
      onPressed: () async {
        if (emailController.text.isNotEmpty &&
            passwordController.text.isNotEmpty &&
            confirmPasswordController.text.isNotEmpty &&
            passwordController.text == confirmPasswordController.text) {
          try {
            final userCredentials =
                await FirebaseAuth.instance.createUserWithEmailAndPassword(
              email: emailController.text,
              password: passwordController.text,
            );
            final user = userCredentials.user;
            if (user != null) {
              final keys = crypto.generateKeys();
              await secureStorage.storeKeys(
                account: emailController.text,
                keys: keys,
              );
              await profileRepository.addProfile(
                user.uid,
                Profile(
                  publicKey: crypto.encodePublicKeyToPemPKCS1(keys.publicKey),
                ),
              );
              await Navigator.of(context).pushReplacementNamed('/sign_in');
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Success')),
              );
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
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(context.t.allFieldsRequired)),
          );
        }
      },
      child: Text(context.t.register),
    );
  }
}
