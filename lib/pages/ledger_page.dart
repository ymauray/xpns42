import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpns42/l10n/l10n_extension.dart';
import 'package:xpns42/models/local_ledger.dart';
import 'package:xpns42/widgets/form_field_wrapper.dart';

class LedgerPage extends ConsumerWidget {
  const LedgerPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ledger = ModalRoute.of(context)!.settings.arguments as LocalLedger?;

    return Scaffold(
      appBar: AppBar(
        title: Text(ledger?.title ?? context.t.newLedger),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {},
          ),
        ],
      ),
      body: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FormFieldWrapper(
              leading: const Icon(Icons.book_online_outlined),
              label: context.t.ledgerTitle,
              formField: TextFormField(
                decoration: InputDecoration(
                  hintText: context.t.ledgerTitle,
                  border: InputBorder.none,
                ),
              ),
            ),
            FormFieldWrapper(
              leading: const Icon(Icons.person_2_outlined),
              label: context.t.firstPerson,
              formField: TextFormField(
                decoration: InputDecoration(
                  hintText: context.t.firstPerson,
                  border: InputBorder.none,
                ),
              ),
            ),
            FormFieldWrapper(
              leading: const Icon(Icons.person_2),
              label: context.t.secondPerson,
              formField: TextFormField(
                decoration: InputDecoration(
                  hintText: context.t.secondPerson,
                  border: InputBorder.none,
                ),
              ),
            ),
            FormFieldWrapper(
              leading: const Icon(Icons.money_rounded),
              label: context.t.currency,
              formField: const Text('CHF'),
              trailing: const Icon(Icons.chevron_right),
            ),
          ],
        ),
      ),
    );
  }
}
