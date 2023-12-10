import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpns42/l10n/l10n_extension.dart';
import 'package:xpns42/providers/active_local_ledger.dart';
import 'package:xpns42/providers/local_ledgers.dart';
import 'package:xpns42/widgets/error_text.dart';
import 'package:xpns42/widgets/ledgers_list.dart';
import 'package:xpns42/widgets/no_ledger_yet.dart';

class LedgersListPage extends ConsumerWidget {
  const LedgersListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localLedgers = ref.watch(localLedgersProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(context.t.ledgers),
        centerTitle: true,
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons.more_horiz),
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'add',
                child: Row(
                  children: [
                    const Icon(Icons.add),
                    const VerticalDivider(),
                    Text(context.t.addLedger),
                  ],
                ),
              ),
              PopupMenuItem(
                value: 'import',
                child: Row(
                  children: [
                    const Icon(Icons.upload),
                    const VerticalDivider(),
                    Text(context.t.importLedger),
                  ],
                ),
              ),
            ],
            onSelected: (value) async {
              if (value == 'add') {
                ref.read(activeLocalLedgerProvider.notifier).set(null);
                await Navigator.of(context).pushNamed('/ledger');
              }
            },
          ),
        ],
      ),
      body: localLedgers.when(
        data: (data) =>
            data.isEmpty ? const NoLedgerYet() : LedgersList(ledgers: data),
        error: (error, stack) => const Center(
          child: ErrorText(code: ErrorCode.errorLoadingLedgers),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
