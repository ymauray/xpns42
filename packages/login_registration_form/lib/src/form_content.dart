import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_registration_form/src/form_button.dart';
import 'package:login_registration_form/src/form_state.dart';
import 'package:login_registration_form/src/form_text_field.dart';

class FormContent extends ConsumerWidget {
  FormContent({
    required this.identifier,
    super.key,
  }) {
    identifierController.text = identifier ?? '';
  }

  final String? identifier;

  final TextEditingController identifierController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formState = ref.watch(formStateControllerProvider);

    return Row(
      children: [
        Expanded(
          child: ColoredBox(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 16,
                left: 32,
                right: 32,
              ),
              child: Column(
                children: [
                  FormTextField(
                    label: 'Identifier',
                    controller: identifierController,
                    readOnly: formState.loading,
                    prefixIcon: const Icon(Icons.people),
                    focusColor: const Color(0xFFa473cd),
                  ),
                  FormTextField.password(
                    label: 'Password',
                    controller: passwordController,
                    readOnly: formState.loading,
                    prefixIcon: const Icon(Icons.lock),
                    focusColor: const Color(0xFFa473cd),
                  ),
                  if (!formState.isRegistrationForm) ...[
                    FormButton(
                      label: formState.loading
                          ? const SizedBox(
                              height: 16,
                              width: 16,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            )
                          : const Text('LOGIN'),
                      backgroundColor: const Color(0xFFa473cd),
                      foregroundColor: Colors.white,
                      onPressed: () async {
                        if (formState.loading) return;
                        if (identifierController.text.isEmpty ||
                            passwordController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('All fields are required'),
                            ),
                          );
                          return;
                        }
                        ref
                            .read(formStateControllerProvider.notifier)
                            .toggleLoading();
                        await Future<void>.delayed(const Duration(seconds: 2));
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Login successful'),
                          ),
                        );
                        ref
                            .read(formStateControllerProvider.notifier)
                            .toggleLoading();
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: TextButton(
                        onPressed: () {
                          ref
                              .read(formStateControllerProvider.notifier)
                              .toggle();
                        },
                        child: const Text(
                          "Don't have an account ? Sign up !",
                          style: TextStyle(color: Color(0xFFa473cd)),
                        ),
                      ),
                    ),
                  ],
                  if (formState.isRegistrationForm) ...[
                    FormTextField.password(
                      label: 'Confirm Password',
                      controller: confirmPasswordController,
                      readOnly: formState.loading,
                      prefixIcon: const Icon(Icons.lock_outline),
                      focusColor: const Color(0xFFa473cd),
                    ),
                    FormButton(
                      label: formState.loading
                          ? const SizedBox(
                              height: 16,
                              width: 16,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            )
                          : const Text('REGISTER'),
                      backgroundColor: const Color(0xFFa473cd),
                      foregroundColor: Colors.white,
                      onPressed: () async {
                        if (formState.loading) return;
                        if (identifierController.text.isEmpty ||
                            passwordController.text.isEmpty ||
                            confirmPasswordController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('All fields are required'),
                            ),
                          );
                          return;
                        }
                        if (passwordController.text !=
                            confirmPasswordController.text) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Passwords do not match'),
                            ),
                          );
                          return;
                        }
                        ref
                            .read(formStateControllerProvider.notifier)
                            .toggleLoading();
                        await Future<void>.delayed(const Duration(seconds: 2));
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Registration successful'),
                          ),
                        );
                        ref
                            .read(formStateControllerProvider.notifier)
                            .toggleLoading();
                        ref.read(formStateControllerProvider.notifier).toggle();
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: TextButton(
                        onPressed: () {
                          ref
                              .read(formStateControllerProvider.notifier)
                              .toggle();
                        },
                        child: const Text(
                          'Already have an account ? Sign in !',
                          style: TextStyle(color: Color(0xFFa473cd)),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
