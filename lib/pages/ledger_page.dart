import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpns42/l10n/l10n_extension.dart';
import 'package:xpns42/models/local_ledger.dart';
import 'package:xpns42/providers/local_ledgers.dart';
import 'package:xpns42/widgets/form/wrapped_text_form_field.dart';

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
    final currencyController = TextEditingController(text: ledger?.currency);
    final currentPasswordController = TextEditingController();
    final passwordController = TextEditingController();
    final checkPasswordController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    void saveLedger() {
      if (formKey.currentState!.validate()) {
        final state = formKey.currentState;
        if (state != null) {
          final ledgerTitle = ledgerTitleController.text;
          final firstPerson = firstPersonController.text;
          final secondPerson = secondPersonController.text;
          final currency = currencyController.text;
          final password = passwordController.text;
          final currentPassword = currentPasswordController.text;

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
                password: password == '' ? currentPassword : password,
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /*
               * ========================
               * Ledger title
               * ========================
               */
              WrappedTextFormField(
                iconData: Icons.book_online_outlined,
                label: context.t.ledgerTitle,
                controller: ledgerTitleController,
                validator: (value) => value!.isEmpty ? '' : null,
                textCapitalization: TextCapitalization.sentences,
                tileColor: Theme.of(context).colorScheme.surfaceVariant,
              ),
              /*
               * ========================
               * First person
               * ========================
               */
              WrappedTextFormField(
                iconData: Icons.person_2_outlined,
                label: context.t.firstPerson,
                controller: firstPersonController,
                validator: (value) => value!.isEmpty ? '' : null,
                textCapitalization: TextCapitalization.sentences,
                tileColor: Theme.of(context).colorScheme.surfaceVariant,
              ),
              /*
               * ========================
               * Second person
               * ========================
               */
              WrappedTextFormField(
                iconData: Icons.person_2,
                label: context.t.secondPerson,
                controller: secondPersonController,
                validator: (value) => value!.isEmpty ? '' : null,
                textCapitalization: TextCapitalization.sentences,
                tileColor: Theme.of(context).colorScheme.surfaceVariant,
              ),
              /*
               * ========================
               * Currency
               * ========================
               */
              WrappedTextFormField(
                iconData: Icons.money_rounded,
                label: context.t.currency,
                controller: currencyController,
                validator: (value) =>
                    currencyController.text.isEmpty ? '' : null,
                readonly: true,
                onTap: () {
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (context) {
                      return ListView(
                        children: [
                          ListTile(
                            title: const Text('CHF'),
                            onTap: () {
                              currencyController.text = 'CHF';
                              Navigator.of(context).pop();
                            },
                          ),
                          ListTile(
                            title: const Text('EUR'),
                            onTap: () {
                              currencyController.text = 'EUR';
                              Navigator.of(context).pop();
                            },
                          ),
                          ListTile(
                            title: const Text('USD'),
                            onTap: () {
                              currencyController.text = 'USD';
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                trailing: const Icon(Icons.chevron_right),
                tileColor: Theme.of(context).colorScheme.surfaceVariant,
              ),
              /*
               * ========================
               * Current password
               * ========================
               */
              if (ledger != null)
                WrappedTextFormField(
                  iconData: Icons.lock,
                  label: context.t.currentPassword,
                  controller: currentPasswordController,
                  validator: (value) {
                    debugPrint('value: $value');
                    if (value! != ledger.password) {
                      return 'Mot de passe incorrect';
                    }
                    return null;
                  },
                  obscureText: true,
                  tileColor: Theme.of(context).colorScheme.surfaceVariant,
                ),
              /*
               * ========================
               * Password
               * ========================
               */
              if (ledger == null)
                WrappedTextFormField(
                  iconData: Icons.lock,
                  label: context.t.password,
                  controller: passwordController,
                  validator: (value) => value!.isEmpty ? '' : null,
                  obscureText: true,
                  tileColor: Theme.of(context).colorScheme.surfaceVariant,
                ),
              /*
               * ========================
               * Confirm password
               * ========================
               */
              if (ledger == null)
                WrappedTextFormField(
                  iconData: Icons.lock,
                  label: context.t.confirmPassword,
                  controller: checkPasswordController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return '';
                    }
                    if (value != passwordController.text) {
                      return '';
                    }
                    return null;
                  },
                  obscureText: true,
                  tileColor: Theme.of(context).colorScheme.surfaceVariant,
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
                            // confirm deletion
                            showDialog<void>(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text(context.t.deleteLedger),
                                  content: Text(context.t.confirmDeleteLedger),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text(context.t.cancel),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        ref
                                            .read(
                                              localLedgersProvider.notifier,
                                            )
                                            .d(ledger);
                                        Navigator.of(context).pop();
                                        Navigator.of(context).pop();
                                      },
                                      child: Text(context.t.delete),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
