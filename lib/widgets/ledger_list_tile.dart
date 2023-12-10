import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpns42/models/local_ledger.dart';

class LedgerListTile extends ConsumerWidget {
  const LedgerListTile({required this.localLedger, super.key});

  final LocalLedger localLedger;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      title: Text(
        localLedger.title,
        style: Theme.of(context).textTheme.titleLarge,
      ),
      trailing: Column(
        children: [
          Text(
            localLedger.currency,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          Text('0.00', style: Theme.of(context).textTheme.titleLarge),
        ],
      ),
      subtitle:
          Text('${localLedger.firstPerson} & ${localLedger.secondPerson}'),
      onTap: () {
        if (localLedger.hasTransactions) {
        } else {
          Navigator.of(context).pushNamed(
            '/ledger',
            arguments: localLedger,
          );
        }
      },
      shape: const Border(
        bottom: BorderSide(
          color: Colors.grey,
          width: 0.5,
        ),
      ),
    );
  }
}
