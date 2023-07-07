import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpns42/provider/auth_provider.dart';
import 'package:xpns42/provider/books_provider.dart';
import 'package:xpns42/provider/long_operation_status_provider.dart';
import 'package:xpns42/utils/localization_extension.dart';
import 'package:xpns42/widget/long_operation_indicator.dart';
import 'package:xpns42/widget/padded_form.dart';

class SignInPage extends ConsumerWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final username = ref.watch(authProvider).currentUserDisplayName;
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: SingleChildScrollView(
              child: PaddedForm(
                formKey: formKey,
                children: [
                  if (FirebaseAuth.instance.currentUser != null) ...[
                    _buildContinueAsLink(context, username, ref),
                    _buildDivider(context),
                  ],
                  _buildEmailField(emailController, context),
                  _buildPasswordField(passwordController, context),
                  _buildForgotPasswordLink(context),
                  _buildSignInButton(
                    context,
                    emailController,
                    passwordController,
                    formKey,
                    ref,
                  ),
                  _buildRegisterLink(context),
                ],
              ),
            ),
          ),
          const LongOperationIndicator(),
        ],
      ),
    );
  }

  Row _buildContinueAsLink(
    BuildContext context,
    String? username,
    WidgetRef ref,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () async {
            await ref.read(booksProvider.notifier).loadBooks();
            await Navigator.of(context).pushReplacementNamed('/home');
          },
          child: Text(
            textAlign: TextAlign.center,
            context.t.continueAs(username!),
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Row _buildDivider(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider()),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(context.t.or),
        ),
        const Expanded(child: Divider()),
      ],
    );
  }

  TextFormField _buildEmailField(
    TextEditingController emailController,
    BuildContext context,
  ) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: emailController,
      decoration: InputDecoration(
        labelText: context.t.email,
      ),
      validator: (value) => value == null || value.isEmpty ? '' : null,
    );
  }

  TextFormField _buildPasswordField(
    TextEditingController passwordController,
    BuildContext context,
  ) {
    return TextFormField(
      obscureText: true,
      controller: passwordController,
      decoration: InputDecoration(
        labelText: context.t.password,
      ),
      validator: (value) => value == null || value.isEmpty ? '' : null,
    );
  }

  Row _buildForgotPasswordLink(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          context.t.forgotPassword,
          style: Theme.of(context).textTheme.labelSmall!.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
        ),
      ],
    );
  }

  // ignore: long-parameter-list
  ElevatedButton _buildSignInButton(
    BuildContext context,
    TextEditingController emailController,
    TextEditingController passwordController,
    GlobalKey<FormState> formKey,
    WidgetRef ref,
  ) {
    return ElevatedButton(
      child: Text(context.t.signIn),
      onPressed: () async {
        if (!formKey.currentState!.validate()) {
          return;
        }
        FocusManager.instance.primaryFocus?.unfocus();
        ref.read(longOperationStatusProvider.notifier).start();
        try {
          await ref.read(authProvider).loginUser(
                email: emailController.text,
                password: passwordController.text,
              );
          await ref.read(booksProvider.notifier).loadBooks();
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
    );
  }

  Row _buildRegisterLink(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () async {
            await Navigator.of(context).pushReplacementNamed('/register');
          },
          child: Text(
            context.t.noAccountYet,
            style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
        ),
      ],
    );
  }
}
