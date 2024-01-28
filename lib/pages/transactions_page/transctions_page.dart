import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpns42/models/ledger.dart';
import 'package:xpns42/providers/transactions_provider.dart';
import 'package:xpns42/wigets/transactions_list.dart';

class TransactionsPage extends ConsumerWidget {
  const TransactionsPage({
    required this.ledger,
    super.key,
  });

  final Ledger ledger;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transactions = ref.watch(transactionsProvider(ledger.id));

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: transactions.when(
        data: TransactionsList.new,
        error: (e, s) => Center(
          child: Text('Erruer lors du chargement des transactions : $e'),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Ajouter une transaction',
        child: const Icon(Icons.add),
      ),
    );
  }
}
