import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';
import 'package:xpns42/providers/groups_provider.dart';

class GroupForm extends ConsumerWidget {
  const GroupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16),
            TextFormField(
              controller: nameController,
              autofocus: true,
              textCapitalization: TextCapitalization.sentences,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                label: Text('Nom du groupe'),
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
                    ref.read(groupsProvider.notifier).createGroup(
                          name: nameController.text,
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

  static void show(BuildContext context) {
    WoltModalSheet.show<void>(
      context: context,
      pageListBuilder: (context) => [
        WoltModalSheetPage(
          hasSabGradient: false,
          topBarTitle: Text(
            'Nouveau groupe',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          isTopBarLayerAlwaysVisible: true,
          trailingNavBarWidget: IconButton(
            padding: const EdgeInsets.all(16),
            icon: const Icon(Icons.close),
            onPressed: Navigator.of(context).pop,
          ),
          child: const GroupForm(),
        ),
      ],
    );
  }
}
