import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpns42/l10n/l10n_extension.dart';
import 'package:xpns42/repositories/ledger_repository.dart';
import 'package:xpns42/widgets/padded_row.dart';

class ImportLedgerForm extends ConsumerWidget {
  const ImportLedgerForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final codeController = TextEditingController();
    final passwordController = TextEditingController();

    final formKey = GlobalKey<FormState>();

    return Form(
      key: formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          PaddedRow(
            child: TextFormField(
              controller: codeController,
              decoration: InputDecoration(
                labelText: context.t.code,
              ),
              validator: (value) => value!.isEmpty ? '' : null,
            ),
          ),
          PaddedRow(
            child: TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: context.t.ledgerPassword,
              ),
              validator: (value) => value!.isEmpty ? '' : null,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 16),
            child: Divider(
              thickness: 1,
              color: Colors.white38,
            ),
          ),
          PaddedRow(
            top: 0,
            child: ElevatedButton(
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  final unlocked =
                      await ref.read(ledgerRepositoryProvider).importLedger(
                            code: codeController.text,
                            password: passwordController.text,
                          );
                  if (unlocked == null) {
                    await showDialog<void>(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(
                            context.t.error,
                            textAlign: TextAlign.center,
                          ),
                          content: Text(context.t.ledgerCannotBeImported),
                          actions: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(context.t.ok),
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    await Navigator.of(context).pushReplacementNamed(
                      '/ledger',
                      arguments: unlocked,
                    );
                    return;
                  }
                }
              },
              child: const Text('Import'),
            ),
          ),
        ],
      ),
    );
  }
}
