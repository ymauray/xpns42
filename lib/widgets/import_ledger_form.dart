import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpns42/l10n/l10n_extension.dart';
import 'package:xpns42/providers/ledgers.dart';
import 'package:xpns42/providers/secure_storage_provider.dart';
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
              autofocus: true,
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
                  final ledger =
                      await ref.read(ledgerRepositoryProvider).importLedger(
                            code: codeController.text,
                            password: passwordController.text,
                          );
                  if (ledger == null) {
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
                    final secureStorage = ref.read(secureStorageProvider);
                    //await secureStorage.write(
                    //  key: 'ledgerId',
                    //  value: ledger.id,
                    //);
                    await secureStorage.write(
                      key: 'ledgerPassword',
                      value: passwordController.text,
                    );
                    final ledgersNotifier = ref.read(ledgersProvider.notifier);
                    //await ledgersNotifier.add(ledger);
                    await Navigator.of(context).pushReplacementNamed(
                      '/ledger',
                      arguments: ledger,
                    );
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
