import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpns42/models/group.dart';
import 'package:xpns42/pages/transactions_page/transctions_page.dart';
import 'package:xpns42/providers/ledgers_provider.dart';
import 'package:xpns42/wigets/delete_ledger_confirm_dialog.dart';
import 'package:xpns42/wigets/ledger_card.dart';

class LedgersList extends ConsumerWidget {
  const LedgersList({
    required this.group,
    super.key,
  });

  final Group group;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ledgers = ref.watch(ledgersProvider(group.id!));
    return ledgers.when(
      data: (ledgers) {
        return ReorderableListView.builder(
          itemCount: ledgers.length,
          onReorder: (oldIndex, newIndex) {
            if (oldIndex < newIndex) {
              newIndex -= 1;
            }
            final ledger = ledgers.removeAt(oldIndex);
            ledgers.insert(newIndex, ledger);
            ref.read(ledgersProvider(group.id!).notifier).reorder();
          },
          itemBuilder: (context, index) {
            final ledger = ledgers[index];
            return LedgerCard(
              key: ValueKey(ledger.id),
              ledger: ledger,
              confirmDismiss: (direction) {
                DeleteLedgerConfirmDialog.show(context, ledger, group.id!);
                return Future.value(false);
              },
              onDismissed: (direction) {
                ledgers.removeAt(index);
                ref.read(ledgersProvider(group.id!).notifier).reorder();
              },
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (context) => TransactionsPage(ledger: ledger),
                  ),
                );
              },
            );
          },
        );
      },
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      error: (error, stack) => Center(
        child: Text('Error : $error'),
      ),
    );
  }
}
