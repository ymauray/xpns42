import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpns42/models/ledger.dart';

class LedgerCard extends ConsumerWidget {
  const LedgerCard({
    required this.ledger,
    super.key,
  });

  final Ledger ledger;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: ListTile(
        title: Text(ledger.title),
        subtitle: Text('${ledger.firstPerson} & ${ledger.secondPerson}'),
        trailing: const Icon(
          Icons.keyboard_arrow_right_outlined,
        ),
        leading: const Icon(
          // TODO : fix that !
          Icons.lock,
        ),
        onTap: () async {
          await Navigator.of(context).pushNamed(
            '/ledger',
            arguments: ledger,
          );
          /*
          const found = false;
          if (found) {
            await showDialog<void>(
              context: context,
              builder: (context) => LedgerPasswordDialog(ledger),
            );
          } else {
            await showDialog<void>(
              context: context,
              builder: (context) => AlertDialog(
                title: Text(
                  context.t.error,
                  textAlign: TextAlign.center,
                ),
                content: Text(context.t.ledgerDoesNotExit),
                actions: [
                  ElevatedButton(
                    onPressed: () async {},
                    child: Text(context.t.ok),
                  ),
                ],
              ),
            );
          }
          */
        },
      ),
    );
  }
}
