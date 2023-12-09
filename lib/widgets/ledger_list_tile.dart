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
      subtitle:
          Text('${localLedger.firstPerson} & ${localLedger.secondPerson}'),
      onTap: () {
        Navigator.of(context).pushNamed(
          '/ledger',
          arguments: localLedger,
        );
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
