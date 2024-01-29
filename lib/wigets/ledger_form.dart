import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';
import 'package:xpns42/providers/ledgers_provider.dart';

class LedgerForm extends ConsumerWidget {
  const LedgerForm({
    required this.groupId,
    super.key,
  });

  final String groupId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();

    final titleController = TextEditingController();
    final firstPersonController = TextEditingController();
    final secondPersonController = TextEditingController();

    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16),
            TextFormField(
              controller: titleController,
              autofocus: true,
              textCapitalization: TextCapitalization.sentences,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                label: Text('Nom du compte'),
                errorStyle: TextStyle(
                  height: 0.01,
                  color: Colors.transparent,
                ),
              ),
              validator: (value) =>
                  value!.isEmpty ? 'Ce champs est requis' : null,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: firstPersonController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                label: Text('Nom de la première personne'),
                errorStyle: TextStyle(
                  height: 0.01,
                  color: Colors.transparent,
                ),
              ),
              validator: (value) =>
                  value!.isEmpty ? 'Ce champs est requis' : null,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: secondPersonController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                label: Text('Nom de la deuxième personne'),
                errorStyle: TextStyle(
                  height: 0.01,
                  color: Colors.transparent,
                ),
              ),
              validator: (value) =>
                  value!.isEmpty ? 'Ce champs est requis' : null,
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    ref.read(ledgersProvider(groupId).notifier).createLedger(
                          title: titleController.text,
                          groupId: groupId,
                          firstPerson: firstPersonController.text,
                          secondPerson: secondPersonController.text,
                        );
                    Navigator.of(context).pop();
                  }
                },
                child: const Text('CREER'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static void show(BuildContext context, String groupId) {
    WoltModalSheet.show<void>(
      context: context,
      pageListBuilder: (context) => [
        WoltModalSheetPage(
          hasSabGradient: false,
          topBarTitle: Text(
            'Nouveau compte',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          isTopBarLayerAlwaysVisible: true,
          trailingNavBarWidget: IconButton(
            padding: const EdgeInsets.all(16),
            icon: const Icon(Icons.close),
            onPressed: Navigator.of(context).pop,
          ),
          child: LedgerForm(groupId: groupId),
        ),
      ],
    );
  }
}
