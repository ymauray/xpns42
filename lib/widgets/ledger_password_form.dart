import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpns42/l10n/l10n_extension.dart';
import 'package:xpns42/models/ledger_proxy.dart';
import 'package:xpns42/repositories/ledger_repository.dart';
import 'package:xpns42/widgets/padded_row.dart';

class LedgerPasswordForm extends ConsumerWidget {
  const LedgerPasswordForm(this.ledgerProxy, {super.key});

  final LedgerProxy ledgerProxy;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final passwordController = TextEditingController();

    final formKey = GlobalKey<FormState>();

    return Form(
      key: formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          PaddedRow(
            child: TextFormField(
              controller: passwordController,
              obscureText: true,
              validator: (value) => value!.isEmpty ? '' : null,
            ),
          ),
          PaddedRow(
            child: ElevatedButton(
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  final unlocked =
                      await ref.read(ledgerRepositoryProvider).unlockLedger(
                            id: ledgerProxy.id,
                            password: passwordController.text,
                          );
                  if (unlocked) {
                    await Navigator.of(context).pushReplacementNamed(
                      '/ledger',
                      arguments: ledgerProxy,
                    );
                  } else {
                    Navigator.of(context).pop();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.red,
                        content: Text(context.t.unlockFailed),
                      ),
                    );
                  }
                }
              },
              child: Text(context.t.unlock),
            ),
          ),
        ],
      ),
    );
  }
}
