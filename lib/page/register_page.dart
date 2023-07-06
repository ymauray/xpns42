import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpns42/provider/auth_provider.dart';
import 'package:xpns42/provider/long_operation_status_provider.dart';
import 'package:xpns42/utils/localization_extension.dart';
import 'package:xpns42/widget/long_operation_indicator.dart';
import 'package:xpns42/widget/padded_form.dart';

class RegisterPage extends ConsumerWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final passwordController2 = TextEditingController();

    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: SingleChildScrollView(
              child: PaddedForm(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: context.t.email,
                    ),
                  ),
                  TextFormField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      labelText: context.t.password,
                    ),
                  ),
                  TextFormField(
                    obscureText: true,
                    controller: passwordController2,
                    decoration: InputDecoration(
                      labelText: context.t.confirmPassword,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (emailController.text.isEmpty ||
                          passwordController.text.isEmpty ||
                          passwordController2.text.isEmpty) {
                        return;
                      }
                      FocusManager.instance.primaryFocus?.unfocus();
                      ref.read(longOperationStatusProvider.notifier).start();
                      try {
                        await ref.read(authProvider).registerUser(
                              email: emailController.text,
                              password: passwordController.text,
                            );
                        ref.read(longOperationStatusProvider.notifier).stop();
                        await Navigator.of(context)
                            .pushReplacementNamed('/login');
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
                    child: Text(context.t.register),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () async {
                          await Navigator.of(context)
                              .pushReplacementNamed('/login');
                        },
                        child: Text(
                          context.t.alreadyHaveAnAccount,
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall!
                              .copyWith(
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
          const LongOperationIndicator(),
        ],
      ),
    );
  }
}
