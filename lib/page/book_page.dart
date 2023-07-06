import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpns42/model/book.dart';
import 'package:xpns42/provider/expenses_provider.dart';

class BookPage extends ConsumerWidget {
  const BookPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final args = ModalRoute.of(context)!.settings.arguments as Book?;

    final expenses = ref.watch(expensesProvider(args!.id));

    ref.read(expensesProvider(args.id).notifier).addExpense();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Expenses'),
        actions: [
          IconButton(
            onPressed: () async {
              await Navigator.of(context).pushNamed('/expenses/add');
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: const Center(
        child: Text('Expenses'),
      ),
    );
  }
}
