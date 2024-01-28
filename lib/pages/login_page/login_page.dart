import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpns42/pages/home_page/home_page.dart';
import 'package:xpns42/pages/login_page/login_page_state_provider.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    final state = ref.watch(loginPageStateProvider);
    final stateNotifier = ref.read(loginPageStateProvider.notifier);

    final firstNameController = TextEditingController(text: state.firstName);
    final emailController = TextEditingController(text: state.email);
    final passwordController = TextEditingController(text: state.password);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Duo Budget'),
      ),
      body: Form(
        key: formKey,
        child: Center(
          child: SizedBox(
            width: 300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (state.showRegistrationForm) ...[
                  TextFormField(
                    controller: firstNameController,
                    textCapitalization: TextCapitalization.words,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      label: Text('Prénom'),
                      errorStyle:
                          TextStyle(height: 0.01, color: Colors.transparent),
                    ),
                    validator: (value) =>
                        state.showRegistrationForm && value!.isEmpty
                            ? 'Ce champs est requis'
                            : null,
                  ),
                  const SizedBox(height: 16),
                ],
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    label: Text('Adresse Email'),
                    errorStyle:
                        TextStyle(height: 0.01, color: Colors.transparent),
                  ),
                  validator: (value) =>
                      value!.isEmpty ? 'Ce champs est requis' : null,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  obscuringCharacter: '*',
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    label: Text('Mot de passe'),
                    errorStyle:
                        TextStyle(height: 0.01, color: Colors.transparent),
                  ),
                  validator: (value) =>
                      value!.isEmpty ? 'Ce champs est requis' : null,
                ),
                if (!state.showRegistrationForm) ...[
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          debugPrint('Connexion');
                          final loggedIn = await stateNotifier.login(
                            email: emailController.text,
                            password: passwordController.text,
                          );
                          if (loggedIn) {
                            await Navigator.of(context).push(
                              MaterialPageRoute<void>(
                                builder: (context) => const HomePage(),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                backgroundColor: Colors.red,
                                content: Text(
                                  'Email ou mot de passe incorrect',
                                ),
                              ),
                            );
                          }
                        }
                      },
                      child: const Text('CONNEXION'),
                    ),
                  ),
                  const SizedBox(height: 32),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Mot de passe oublié ?'),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Vous n'avez pas de compte ? "),
                      TextButton(
                        onPressed: stateNotifier.toggleRegistrationForm,
                        child: const Text("S'inscrire"),
                      ),
                    ],
                  ),
                ],
                if (state.showRegistrationForm) ...[
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          final registered = await stateNotifier.register(
                            firstName: firstNameController.text,
                            email: emailController.text,
                            password: passwordController.text,
                          );
                          if (registered) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                backgroundColor: Colors.green,
                                content: Text('Enregistrement réussi'),
                              ),
                            );
                            stateNotifier.toggleRegistrationForm();
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                backgroundColor: Colors.red,
                                content:
                                    Text("Erreur lors de l'enregistrement"),
                              ),
                            );
                          }
                        }
                      },
                      child: const Text('CONTINUER'),
                    ),
                  ),
                  const SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Vous avez déjà un compte? '),
                      TextButton(
                        onPressed: stateNotifier.toggleRegistrationForm,
                        child: const Text('Se connecter'),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
