import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpns42/l10n/l10n_extension.dart';
import 'package:xpns42/models/ledger.dart';
import 'package:xpns42/providers/ledgers.dart';
import 'package:xpns42/providers/secure_storage_provider.dart';

class LedgerPage extends ConsumerWidget {
  const LedgerPage({this.ledger, super.key});

  final Ledger? ledger;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ledger =
        this.ledger ?? ModalRoute.of(context)!.settings.arguments as Ledger;

    final secureStorage = ref.read(secureStorageProvider);

    final ledgerId = secureStorage.read(key: 'ledgerId');
    final ledgerPassword = secureStorage.read(key: 'ledgerPassword');
    Future.wait([ledgerId, ledgerPassword]).then((value) {
      debugPrint(value[0]);
      debugPrint(value[1]);
    });

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: BackButton(
          onPressed: () async {
            await secureStorage.write(key: 'ledgerId', value: null);
            await secureStorage.write(key: 'ledgerPassword', value: null);
            await Navigator.of(context)
                .pushNamedAndRemoveUntil('/', (route) => false);
          },
        ),
        title: Text(ledger.title),
        centerTitle: true,
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons.more_vert),
            onSelected: (value) async {
              if (value == 0) {
                await ref
                    .read(ledgersProvider.notifier)
                    .deleteLedger(ledger.id);
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
