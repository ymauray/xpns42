import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpns42/l10n/l10n_extension.dart';
import 'package:xpns42/providers/active_local_ledger.dart';

class TransactionsListPage extends ConsumerWidget {
  const TransactionsListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localLedger = ref.watch(activeLocalLedgerProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(localLedger?.title ?? ''),
        centerTitle: true,
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons.more_horiz),
            itemBuilder: (context) => <PopupMenuEntry<String>>[
              PopupMenuItem(
                value: 'edit',
                child: Row(
                  children: [
                    const Icon(Icons.edit),
                    const VerticalDivider(),
                    Text(context.t.editLedger),
                  ],
                ),
              ),
              const PopupMenuDivider(),
              PopupMenuItem(
                value: 'add',
                child: Row(
                  children: [
                    const Icon(Icons.add),
                    const VerticalDivider(),
                    Text(context.t.addTransaction),
                  ],
                ),
              ),
            ],
            onSelected: (value) {
              if (value == 'edit') {
                Navigator.of(context).pushNamed('/ledger');
              } else if (value == 'delete') {}
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Text('${context.t.sharingCode} : ${localLedger!.shortCode}'),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) => const ListTile(),
              separatorBuilder: (context, index) => const Divider(),
              itemCount: 0,
            ),
          ),
        ],
      ),
    );
  }
}
