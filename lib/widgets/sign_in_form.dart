import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpns42/l10n/l10n_extension.dart';
import 'package:xpns42/widgets/sign_in_button.dart';

class SignInForm extends ConsumerWidget {
  const SignInForm({
    required this.emailController,
    required this.passwordController,
    super.key,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();

    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            decoration: InputDecoration(labelText: context.t.emailField),
            keyboardType: TextInputType.emailAddress,
            controller: emailController,
            validator: (value) => value!.isEmpty ? '' : null,
          ),
          const SizedBox(height: 16),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(labelText: context.t.passwordField),
            controller: passwordController,
            validator: (value) => value!.isEmpty ? '' : null,
          ),
          const SizedBox(height: 16),
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
          const SizedBox(height: 16),
          // Register link
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .pushReplacementNamed('/forgot_password');
                  },
                  child: Text(
                    context.t.forgotPassword,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Register link
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacementNamed('/register');
                  },
                  child: Text(
                    context.t.register,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
