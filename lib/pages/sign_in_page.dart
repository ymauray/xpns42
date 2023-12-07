import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpns42/l10n/l10n_extension.dart';
import 'package:xpns42/widgets/sign_in_button.dart';

class SignInPage extends ConsumerWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    if (kDebugMode) {
      emailController.text = 'yannick@skym.fr';
      passwordController.text = 'gscmmj12';
    }

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Text(
              context.t.niceToSeeYouAgain,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Expanded(
              child: Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: context.t.emailField,
                          errorStyle: const TextStyle(
                            height: 0,
                            color: Colors.transparent,
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        validator: (value) => value!.isEmpty ? '' : null,
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: context.t.passwordField,
                          errorStyle: const TextStyle(
                            height: 0,
                            color: Colors.transparent,
                          ),
                        ),
                        controller: passwordController,
                        validator: (value) => value!.isEmpty ? '' : null,
                      ),
                      const SizedBox(height: 48),
                      Row(
                        children: [
                          Expanded(
                            child: SignInButton(
                              emailController: emailController,
                              passwordController: passwordController,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Text(
              context.t.appTitle,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              '(c) 2023 - Yannick Mauray / Sandrine Kohler',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
