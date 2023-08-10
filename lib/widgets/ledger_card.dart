import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpns42/models/ledger_proxy.dart';
import 'package:xpns42/widgets/ledger_password_dialog.dart';

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
          await showDialog<void>(
            context: context,
            builder: (context) => LedgerPasswordDialog(ledger),
          );

          //Navigator.of(context).pushNamed(
          //  '/ledger',
          //  arguments: ledger,
          //);
        },
      ),
    );
  }
}
