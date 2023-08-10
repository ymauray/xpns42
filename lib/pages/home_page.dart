import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpns42/l10n/l10n_extension.dart';
import 'package:xpns42/providers/ledgers.dart';
import 'package:xpns42/widgets/import_ledger_dialog.dart';
import 'package:xpns42/widgets/ledger_card.dart';
import 'package:xpns42/widgets/new_ledger_dialog.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncLedgers = ref.watch(ledgersProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(context.t.appTitle),
        centerTitle: true,
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons.more_vert),
            onSelected: (value) async {
              if (value == 0) {
                await FirebaseAuth.instance.signOut();
                await Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/sign_in',
                  (route) => false,
                );
              } else if (value == 1) {
                await showDialog<void>(
                  context: context,
                  builder: (context) => const NewLedgerDialog(),
                );
              } else if (value == 2) {
                await showDialog<void>(
                  context: context,
                  builder: (context) => const ImportLedgerDialog(),
                );
              }
            },
            itemBuilder: (BuildContext context) {
              return <PopupMenuEntry<int>>[
                PopupMenuItem(
                  value: 1,
                  child: Row(
                    children: [
                      const Icon(Icons.add),
                      const SizedBox(width: 8),
                      Text(context.t.addLedger),
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 2,
                  child: Row(
                    children: [
                      const Icon(Icons.import_export),
                      const SizedBox(width: 8),
                      Text(context.t.importALedger),
                    ],
                  ),
                ),
                const PopupMenuDivider(),
                PopupMenuItem(
                  value: 0,
                  child: Row(
                    children: [
                      const Icon(Icons.logout),
                      const SizedBox(width: 8),
                      Text(context.t.logout),
                    ],
                  ),
                ),
              ];
            },
          ),
        ],
      ),
      body: asyncLedgers.when(
        data: (ledgers) {
          return ListView.builder(
            itemCount: ledgers.length,
            itemBuilder: (context, index) {
              final ledger = ledgers[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: LedgerCard(ledger: ledger),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) {
          return Center(child: Text(error.toString()));
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog<void>(
            context: context,
            builder: (context) => const NewLedgerDialog(),
          );
        },
        tooltip: context.t.addLedger,
        child: const Icon(Icons.add),
      ),
    );
  }
}
