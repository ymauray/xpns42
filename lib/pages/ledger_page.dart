import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpns42/l10n/l10n_extension.dart';
import 'package:xpns42/models/local_ledger.dart';
import 'package:xpns42/providers/local_ledgers.dart';
import 'package:xpns42/widgets/form_field_wrapper.dart';

class LedgerPage extends ConsumerWidget {
  const LedgerPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ledger = ModalRoute.of(context)!.settings.arguments as LocalLedger?;

    final ledgerTitleController = TextEditingController(text: ledger?.title);
    final firstPersonController =
        TextEditingController(text: ledger?.firstPerson);
    final secondPersonController =
        TextEditingController(text: ledger?.secondPerson);
    final passwordController = TextEditingController(text: ledger?.password);
    final formKey = GlobalKey<FormState>();

    void saveLedger() {
      if (formKey.currentState!.validate()) {
        final state = formKey.currentState;
        if (state != null) {
          state.save();
          final ledgerTitle = ledgerTitleController.text;
          final firstPerson = firstPersonController.text;
          final secondPerson = secondPersonController.text;
          const currency = 'CHF';
          final password = passwordController.text;

          final localLedgersNotifier = ref.read(localLedgersProvider.notifier);

          if (ledger == null) {
            localLedgersNotifier.c(
              LocalLedger.create(
                title: ledgerTitle,
                firstPerson: firstPerson,
                secondPerson: secondPerson,
                currency: currency,
                password: password,
              ),
            );
          } else {
            localLedgersNotifier.u(
              ledger.copyWith(
                title: ledgerTitle,
                firstPerson: firstPerson,
                secondPerson: secondPerson,
                currency: currency,
                password: password,
              ),
            );
          }
          Navigator.of(context).pop();
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(context.t.formContainsErrors),
            backgroundColor: Colors.red,
          ),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(ledger?.title ?? context.t.newLedger),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: saveLedger,
          ),
        ],
      ),
      body: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FormFieldWrapper(
              leading: const Icon(Icons.book_online_outlined),
              label: context.t.ledgerTitle,
              formField: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: ledgerTitleController,
                validator: (value) => value!.isEmpty ? '' : null,
                textCapitalization: TextCapitalization.sentences,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  errorStyle: TextStyle(
                    height: 0,
                    color: Colors.transparent,
                  ),
                ),
              ),
            ),
            FormFieldWrapper(
              leading: const Icon(Icons.person_2_outlined),
              label: context.t.firstPerson,
              formField: TextFormField(
                controller: firstPersonController,
                validator: (value) => value!.isEmpty ? '' : null,
                textCapitalization: TextCapitalization.sentences,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  errorStyle: TextStyle(
                    height: 0,
                    color: Colors.transparent,
                  ),
                ),
              ),
            ),
            FormFieldWrapper(
              leading: const Icon(Icons.person_2),
              label: context.t.secondPerson,
              formField: TextFormField(
                controller: secondPersonController,
                validator: (value) => value!.isEmpty ? '' : null,
                textCapitalization: TextCapitalization.sentences,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  errorStyle: TextStyle(
                    height: 0,
                    color: Colors.transparent,
                  ),
                ),
              ),
            ),
            FormFieldWrapper(
              leading: const Icon(Icons.money_rounded),
              label: context.t.currency,
              formField: const Padding(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Text('CHF'),
              ),
              trailing: const Icon(Icons.chevron_right),
            ),
            FormFieldWrapper(
              leading: const Icon(Icons.lock),
              label: context.t.password,
              formField: TextFormField(
                controller: passwordController,
                validator: (value) => value!.isEmpty ? '' : null,
                obscureText: true,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  errorStyle: TextStyle(
                    height: 0,
                    color: Colors.transparent,
                  ),
                ),
              ),
            ),
            if (ledger != null)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        child: Text(
                          context.t.deleteLedger,
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    color: Colors.red,
                                  ),
                        ),
                        onPressed: () {
                          ref.read(localLedgersProvider.notifier).d(ledger);
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
