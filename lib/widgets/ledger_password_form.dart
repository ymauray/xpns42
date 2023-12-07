import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpns42/l10n/l10n_extension.dart';
import 'package:xpns42/models/ledger.dart';
import 'package:xpns42/repositories/ledger_repository.dart';
import 'package:xpns42/widgets/padded_row.dart';

class LedgerPasswordForm extends ConsumerWidget {
  const LedgerPasswordForm(this.ledgerProxy, {super.key});

  final Ledger ledgerProxy;

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
                  final ledgerRepository = ref.read(ledgerRepositoryProvider);
                  //final ledger = await ledgerRepository.load(
                  //  ledgerProxy.id,
                  //  passwordController.text,
                  //);
                  const ledger = null;
                  if (ledger != null) {
                    await Navigator.of(context).pushReplacementNamed(
                      '/ledger',
                      arguments: ledger,
                    );
                    return;
                  }
                  await showDialog<void>(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text(
                          context.t.error,
                          textAlign: TextAlign.center,
                        ),
                        content: Text(context.t.wrongPassword),
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
