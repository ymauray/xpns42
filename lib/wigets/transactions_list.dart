import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpns42/models/transaction.dart';

class TransactionsList extends ConsumerWidget {
  const TransactionsList(
    this.transactions, {
    super.key,
  });

  final List<Transaction> transactions;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final td = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Material(
          elevation: td.appBarTheme.elevation ?? 4,
          child: ColoredBox(
            color: td.appBarTheme.backgroundColor ??
                (td.brightness == Brightness.light
                    ? td.colorScheme.primary
                    : td.colorScheme.surface),
            child: const Center(child: Text('Hello, there !')),
          ),
        ),
        if (transactions.isEmpty) const Text('Aucune transaction'),
      ],
    );
  }
}
