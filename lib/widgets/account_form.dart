import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpns42/l10n/l10n_extension.dart';

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
      child: SingleChildScrollView(
        child: Column(
          children: [
            PaddedRow(
              child: TextFormField(
                controller: titleController,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                  labelText: context.t.title,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '';
                  }
                  return null;
                },
              ),
            ),
            PaddedRow(
              child: TextFormField(
                controller: firstPersonController,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                  labelText: context.t.firstPerson,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '';
                  }
                  return null;
                },
              ),
            ),
            PaddedRow(
              child: TextFormField(
                controller: secondPersonController,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                  labelText: context.t.secondPerson,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '';
                  }
                  return null;
                },
              ),
            ),
            PaddedRow(
              child: TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: context.t.bookPassword,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '';
                  }
                  return null;
                },
              ),
            ),
            PaddedRow(
              child: ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')),
                    );
                  }
                },
                child: Text(context.t.addAccount),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PaddedRow extends ConsumerWidget {
  const PaddedRow({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Row(
        children: [
          Expanded(child: Container()),
          Expanded(flex: 4, child: child),
          Expanded(child: Container()),
        ],
      ),
    );
  }
}
