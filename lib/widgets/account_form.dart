import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpns42/l10n/l10n_extension.dart';
import 'package:xpns42/repositories/account_repository.dart';
import 'package:xpns42/widgets/padded_row.dart';

class AccountForm extends ConsumerWidget {
  const AccountForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleController = TextEditingController();
    final firstPersonController = TextEditingController();
    final secondPersonController = TextEditingController();
    final passwordController = TextEditingController();

    final formKey = GlobalKey<FormState>();

    return Form(
      key: formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          PaddedRow(
            child: TextFormField(
              controller: titleController,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                labelText: context.t.title,
              ),
              validator: (value) => value!.isEmpty ? '' : null,
            ),
          ),
          PaddedRow(
            child: TextFormField(
              controller: firstPersonController,
              textCapitalization: TextCapitalization.words,
              decoration: InputDecoration(
                labelText: context.t.firstPerson,
              ),
              validator: (value) => value!.isEmpty ? '' : null,
            ),
          ),
          PaddedRow(
            child: TextFormField(
              controller: secondPersonController,
              textCapitalization: TextCapitalization.words,
              decoration: InputDecoration(
                labelText: context.t.secondPerson,
              ),
              validator: (value) => value!.isEmpty ? '' : null,
            ),
          ),
          PaddedRow(
            child: TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: context.t.bookPassword,
              ),
              validator: (value) => value!.isEmpty ? '' : null,
            ),
          ),
          PaddedRow(
            child: ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  ref.read(accountProvider).createAccount(
                        title: titleController.text,
                        firstPerson: firstPersonController.text,
                        secondPerson: secondPersonController.text,
                        password: passwordController.text,
                      );
                  Navigator.pop(context);
                }
              },
              child: Text(context.t.addAccount),
            ),
          ),
        ],
      ),
    );
  }
}
