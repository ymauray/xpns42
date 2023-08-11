import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpns42/l10n/l10n_extension.dart';
import 'package:xpns42/models/ledger.dart';
import 'package:xpns42/providers/ledgers.dart';

class LedgerPage extends ConsumerWidget {
  const LedgerPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final proxy = ModalRoute.of(context)!.settings.arguments as Ledger;

    return Scaffold(
      appBar: AppBar(
        title: Text(proxy.title),
        centerTitle: true,
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons.more_vert),
            onSelected: (value) async {
              if (value == 0) {
                await ref.read(ledgersProvider.notifier).deleteLedger(proxy.id);
                Navigator.of(context).pop();
              }
            },
            itemBuilder: (BuildContext context) {
              return <PopupMenuEntry<int>>[
                PopupMenuItem(
                  value: 0,
                  child: Row(
                    children: [
                      const Icon(Icons.delete),
                      const SizedBox(width: 8),
                      Text(context.t.deleteLedger),
                    ],
                  ),
                ),
              ];
            },
          ),
        ],
      ),
    );
  }
}
