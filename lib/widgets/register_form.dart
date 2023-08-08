import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpns42/l10n/l10n_extension.dart';
import 'package:xpns42/widgets/register_button.dart';

class RegisterForm extends ConsumerWidget {
  const RegisterForm({
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
    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: context.t.emailField,
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
            ),
            controller: passwordController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return '';
              }
              if (value != confirmPasswordController.text) {
                return '';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: context.t.confirmPasswordField,
            ),
            controller: confirmPasswordController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return '';
              }
              if (value != passwordController.text) {
                return '';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: RegisterButton(
                  emailController: emailController,
                  passwordController: passwordController,
                  confirmPasswordController: confirmPasswordController,
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
                    Navigator.of(context).pushReplacementNamed('/sign_in');
                  },
                  child: Text(
                    context.t.signIn,
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
