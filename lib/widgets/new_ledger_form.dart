import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpns42/l10n/l10n_extension.dart';
import 'package:xpns42/models/ledger_proxy.dart';
import 'package:xpns42/providers/ledgers.dart';
import 'package:xpns42/widgets/lower_divider.dart';
import 'package:xpns42/widgets/padded_row.dart';

class NewLedgerForm extends ConsumerWidget {
  const NewLedgerForm({super.key});

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
                labelText: context.t.ledgerPassword,
              ),
              validator: (value) => value!.isEmpty ? '' : null,
            ),
          ),
          const LowerDivider(),
          PaddedRow(
            child: ElevatedButton(
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  final ledgerId =
                      await ref.read(ledgersProvider.notifier).addLedger(
                            title: titleController.text,
                            firstPerson: firstPersonController.text,
                            secondPerson: secondPersonController.text,
                            password: passwordController.text,
                          );
                  await Navigator.of(context).pushReplacementNamed(
                    '/ledger',
                    arguments: LedgerProxy(
                      id: ledgerId,
                      title: titleController.text,
                    ),
                  );
                }
              },
              child: Text(context.t.addLedger),
            ),
          ),
        ],
      ),
    );
  }
}
