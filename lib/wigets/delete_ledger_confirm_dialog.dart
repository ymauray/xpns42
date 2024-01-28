import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';
import 'package:xpns42/models/ledger.dart';
import 'package:xpns42/providers/ledgers_provider.dart';

class DeleteLedgerConfirmDialog extends ConsumerWidget {
  const DeleteLedgerConfirmDialog({
    required this.ledger,
    required this.groupId,
    super.key,
  });

  final Ledger ledger;
  final String groupId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 16),
          const Text(
            'Êtes-vous sûr de vouloir supprimer ce compte ?',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: Navigator.of(context).pop,
                  child: const Padding(
                    padding: EdgeInsets.all(16),
                    child: Text('Annuler'),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  onPressed: () {
                    ref.read(ledgersProvider(groupId).notifier).remove(ledger);
                    Navigator.of(context).pop();
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(16),
                    child: Text('Supprimer'),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  static Future<void> show(
    BuildContext context,
    Ledger ledger,
    String groupId,
  ) async {
    await WoltModalSheet.show<bool>(
      context: context,
      pageListBuilder: (context) => [
        WoltModalSheetPage(
          hasSabGradient: false,
          topBarTitle: Text(
            ledger.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          isTopBarLayerAlwaysVisible: true,
          trailingNavBarWidget: IconButton(
            padding: const EdgeInsets.all(16),
            icon: const Icon(Icons.close),
            onPressed: Navigator.of(context).pop,
          ),
          child: DeleteLedgerConfirmDialog(
            ledger: ledger,
            groupId: groupId,
          ),
        ),
      ],
    );
  }
}
