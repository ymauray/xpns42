import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:xpns42/page/home/home_page.dart';
import 'package:xpns42/provider/auth_data_provider.dart';
import 'package:xpns42/provider/repository_provider.dart';

class LoginPage extends ConsumerWidget {
  LoginPage({
    super.key,
  });

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmationController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginForm = ref.watch(authDataControllerProvider);
    final pb = ref.read(repositoryProvider);

    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 350,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Xpns42',
                    style: TextStyle(
                      fontSize: 48,
                      fontFamily: 'Percolator',
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: usernameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Username',
                    ),
                    //onSubmitted: (value) => onButtonPressed(),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: passwordController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                    obscureText: true,
                    //onSubmitted: (value) => onButtonPressed(),
                  ),
                  if (!loginForm.isRegistrationForm) ...[
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () async {
                        if (usernameController.text.isEmpty ||
                            passwordController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content:
                                  const Text('Tous les champs sont requis'),
                              backgroundColor:
                                  Theme.of(context).colorScheme.error,
                            ),
                          );

                          return;
                        }
                        try {
                          await pb.collection('users').authWithPassword(
                                usernameController.text,
                                passwordController.text,
                              );
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: const Text('Authentication successful'),
                              backgroundColor: Theme.of(context).primaryColor,
                            ),
                          );
                          passwordController.clear();
                          confirmationController.clear();
                          await Navigator.of(context).pushReplacement(
                            MaterialPageRoute<void>(
                              builder: (_) => const HomePage(),
                            ),
                          );
                        } on ClientException catch (e) {
                          final key =
                              (e.response['data'] as Map<String, dynamic>)
                                  .keys
                                  .first;
                          final map =
                              (e.response['data'] as Map<String, dynamic>)[key]
                                  as Map<String, dynamic>;
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                "$key : ${map['message']}",
                              ),
                              backgroundColor:
                                  Theme.of(context).colorScheme.error,
                            ),
                          );
                        }
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(16),
                        child: Text(
                          'Login',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextButton(
                      onPressed: () {
                        ref
                            .read(authDataControllerProvider.notifier)
                            .registrationForm = true;
                      },
                      child: const Text('No account yet ?'),
                    ),
                  ],
                  if (loginForm.isRegistrationForm) ...[
                    const SizedBox(height: 16),
                    TextField(
                      controller: confirmationController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password confirmation',
                      ),
                      obscureText: true,
                      //onSubmitted: (value) => onButtonPressed(),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () async {
                        if (usernameController.text.isEmpty ||
                            passwordController.text.isEmpty ||
                            confirmationController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: const Text('All fields are required'),
                              backgroundColor:
                                  Theme.of(context).colorScheme.error,
                            ),
                          );

                          return;
                        }
                        if (passwordController.text !=
                            confirmationController.text) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: const Text(
                                'The password and its confirmation '
                                'must be identical',
                              ),
                              backgroundColor:
                                  Theme.of(context).colorScheme.error,
                            ),
                          );

                          return;
                        }
                        try {
                          await pb.collection('users').create(
                            body: {
                              'username': usernameController.text,
                              'password': passwordController.text,
                              'passwordConfirm': confirmationController.text,
                            },
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: const Text('Registration successful'),
                              backgroundColor: Theme.of(context).primaryColor,
                            ),
                          );
                          passwordController.clear();
                          confirmationController.clear();
                          ref
                              .read(authDataControllerProvider.notifier)
                              .registrationForm = false;
                        } on ClientException catch (e) {
                          final key =
                              (e.response['data'] as Map<String, dynamic>)
                                  .keys
                                  .first;
                          final map =
                              (e.response['data'] as Map<String, dynamic>)[key]
                                  as Map<String, dynamic>;
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                "$key : ${map['message']}",
                              ),
                              backgroundColor:
                                  Theme.of(context).colorScheme.error,
                            ),
                          );
                        }
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(16),
                        child: Text(
                          'Register',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextButton(
                      onPressed: () {
                        ref
                            .read(authDataControllerProvider.notifier)
                            .registrationForm = false;
                      },
                      child: const Text('Already have an account ?'),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
