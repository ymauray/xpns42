import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpns42/l10n/l10n_extension.dart';

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
                child: Form(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: context.t.emailField,
                        ),
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: context.t.passwordField,
                        ),
                        controller: passwordController,
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: context.t.confirmPasswordField,
                        ),
                        controller: confirmPasswordController,
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () async {
                                if (emailController.text.isNotEmpty &&
                                    passwordController.text.isNotEmpty &&
                                    confirmPasswordController.text.isNotEmpty &&
                                    passwordController.text ==
                                        confirmPasswordController.text) {
                                  try {
                                    final userCredentials = await FirebaseAuth
                                        .instance
                                        .createUserWithEmailAndPassword(
                                      email: emailController.text,
                                      password: passwordController.text,
                                    );
                                    final user = userCredentials.user;
                                    if (user != null) {
                                      await Navigator.of(context)
                                          .pushReplacementNamed(
                                        '/sign_in',
                                      );
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                            'Success',
                                          ),
                                        ),
                                      );
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            context.t.registrationFailed,
                                          ),
                                        ),
                                      );
                                    }
                                  } catch (e) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          context.t.registrationFailed,
                                        ),
                                      ),
                                    );
                                  }
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content:
                                          Text(context.t.allFieldsRequired),
                                    ),
                                  );
                                }
                              },
                              child: Text(context.t.register),
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
