import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpns42/l10n/l10n_extension.dart';
import 'package:xpns42/models/ledger_proxy.dart';
import 'package:xpns42/providers/ledgers.dart';
import 'package:xpns42/repositories/ledger_repository.dart';
import 'package:xpns42/widgets/ledger_password_dialog.dart';
import 'package:xpns42/widgets/lower_divider.dart';
import 'package:xpns42/widgets/padded_row.dart';
import 'package:xpns42/widgets/title_divider.dart';

class LedgerCard extends ConsumerWidget {
  const LedgerCard({
    required this.ledger,
    super.key,
  });

  final LedgerProxy ledger;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: ListTile(
        title: Text(ledger.title),
        trailing: const Icon(
          Icons.keyboard_arrow_right_outlined,
        ),
        onTap: () async {
          final found = await ref
              .read(ledgerRepositoryProvider)
              .checkLedgerExists(ledger.id);
          if (found) {
            await showDialog<void>(
              context: context,
              builder: (context) => LedgerPasswordDialog(ledger),
            );
          } else {
            await showDialog<void>(
              context: context,
              builder: (context) => SimpleDialog(
                title: Text(
                  context.t.error,
                  textAlign: TextAlign.center,
                ),
                children: [
                  const TitleDivider(),
                  PaddedRow(
                    child: Text(context.t.ledgerDoesNotExit),
                  ),
                  const LowerDivider(),
                  PaddedRow(
                    child: ElevatedButton(
                      onPressed: () async {
                        await ref
                            .read(ledgersProvider.notifier)
                            .deleteLedger(ledger.id);
                        Navigator.of(context).pop();
                      },
                      child: Text(context.t.ok),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
