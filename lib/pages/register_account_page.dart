import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpns42/l10n/l10n_extension.dart';
import 'package:xpns42/widgets/register_form.dart';

class RegisterAccountPage extends ConsumerWidget {
  const RegisterAccountPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final confirmPasswordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text(context.t.register),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Row(
            children: [
              Expanded(child: Container()),
              Expanded(
                flex: 2,
                child: RegisterForm(
                  emailController: emailController,
                  passwordController: passwordController,
                  confirmPasswordController: confirmPasswordController,
                ),
              ),
              Expanded(child: Container()),
            ],
          ),
        ),
      ),
    );
  }
}
