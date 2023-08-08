import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpns42/l10n/l10n_extension.dart';

class ForgotPasswordPage extends ConsumerWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: Text(context.t.forgotPassword),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Row(
            children: [
              Expanded(child: Container()),
              Expanded(
                flex: 2,
                child: Form(
                  key: formKey,
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
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () async {
                                if (formKey.currentState!.validate()) {
                                  try {
                                    await FirebaseAuth.instance
                                        .sendPasswordResetEmail(
                                      email: emailController.text,
                                    );
                                    await Navigator.of(context)
                                        .pushReplacementNamed('/sign_in');
                                  } on FirebaseAuthException catch (e) {
                                    if (e.code == 'user-not-found') {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(context.t.userNotFound),
                                        ),
                                      );
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(e.message ?? ''),
                                        ),
                                      );
                                    }
                                  }
                                }
                              },
                              child: Text(context.t.resetPassword),
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
                                    .pushReplacementNamed('/sign_in');
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
