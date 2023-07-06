import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpns42/provider/auth_provider.dart';
import 'package:xpns42/provider/long_operation_status_provider.dart';
import 'package:xpns42/utils/localization_extension.dart';
import 'package:xpns42/widget/long_operation_indicator.dart';
import 'package:xpns42/widget/padded_form.dart';

class ProfilePage extends ConsumerWidget {
  ProfilePage({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _displayNameController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _emailController.text = FirebaseAuth.instance.currentUser!.email ?? '';
    _displayNameController.text =
        FirebaseAuth.instance.currentUser!.displayName ?? '';

    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(title: Text(context.t.profile)),
          body: PaddedForm(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextFormField(
                controller: _emailController,
                decoration:
                    InputDecoration(labelText: context.t.email, enabled: false),
              ),
              TextFormField(
                controller: _displayNameController,
                decoration: InputDecoration(labelText: context.t.displayName),
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_displayNameController.text.isEmpty) {
                    return;
                  }
                  FocusManager.instance.primaryFocus?.unfocus();
                  ref.read(longOperationStatusProvider.notifier).start();
                  try {
                    await ref.read(authProvider).updateProfile(
                          displayName: _displayNameController.text,
                        );
                    ref.read(longOperationStatusProvider.notifier).stop();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.green,
                        content: Text(context.t.profileUpdatedSuccessfully),
                      ),
                    );
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
                child: Text(context.t.updateProfile),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () async {
                      await Navigator.of(context)
                          .pushReplacementNamed('/login');
                    },
                    child: Text(
                      context.t.changeAccount,
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const LongOperationIndicator(),
      ],
    );
  }
}