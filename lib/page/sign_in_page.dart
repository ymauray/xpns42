import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpns42/provider/auth_provider.dart';
import 'package:xpns42/provider/long_operation_status_provider.dart';
import 'package:xpns42/widget/padded_form.dart';

class SignInPage extends ConsumerWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    final username =
        (FirebaseAuth.instance.currentUser!.displayName ?? '').isEmpty
            ? FirebaseAuth.instance.currentUser!.email
            : FirebaseAuth.instance.currentUser!.displayName;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: PaddedForm(
            children: [
              if (FirebaseAuth.instance.currentUser != null) ...[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        await Navigator.of(context)
                            .pushReplacementNamed('/home');
                      },
                      child: Text(
                        'Continue as $username',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const Row(
                  children: [
                    Expanded(child: Divider()),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Text('or'),
                    ),
                    Expanded(child: Divider()),
                  ],
                ),
              ],
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
              ),
              TextFormField(
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Forgot your password ?',
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                  ),
                ],
              ),
              ElevatedButton(
                child: const Text('Login'),
                onPressed: () async {
                  if (emailController.text.isEmpty ||
                      passwordController.text.isEmpty) {
                    return;
                  }
                  FocusManager.instance.primaryFocus?.unfocus();
                  ref.read(longOperationStatusProvider.notifier).start();
                  try {
                    await ref.read(authProvider).loginUser(
                          email: emailController.text,
                          password: passwordController.text,
                        );
                    ref.read(longOperationStatusProvider.notifier).stop();
                    await Navigator.of(context).pushReplacementNamed('/home');
                  } catch (e) {
                    ref.read(longOperationStatusProvider.notifier).stop();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.red,
                        content: Text(e.toString()),
                      ),
                    );
                  }
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () async {
                      await Navigator.of(context)
                          .pushReplacementNamed('/register');
                    },
                    child: Text(
                      'No account yet ? Register here !',
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
