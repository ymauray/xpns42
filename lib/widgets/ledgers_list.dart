import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpns42/models/local_ledger.dart';
import 'package:xpns42/widgets/ledger_list_tile.dart';

class LedgersList extends ConsumerWidget {
  const LedgersList({required this.ledgers, super.key});

  final List<LocalLedger> ledgers;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      itemBuilder: (context, index) => LedgerListTile(
        localLedger: ledgers[index],
      ),
      itemCount: ledgers.length,
    );
  }
}
