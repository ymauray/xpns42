import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:xpns42/model/transaction.dart';
import 'package:xpns42/provider/books_provider.dart';
import 'package:xpns42/widget/grouped_list_view.dart';
import 'package:xpns42/widget/header.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final book = ref.watch(booksProvider);

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: const Text('Xpns42'),
        centerTitle: true,
        backgroundColor: Colors.grey.shade900,
        elevation: 0,
        //actions: [
        //  IconButton(
        //    icon: const Icon(Icons.add),
        //    onPressed: () => ref.read(booksProvider.notifier).addBook(),
        //  ),
        //],
      ),
      body: book.when(
        data: (book) {
          return Column(
            children: [
              Header(book: book),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: GroupedListView<DateTime, Transaction>(
                    items: book.transactions,
                    keyGetter: (t) => t.date,
                    keySorter: (a, b) => b.compareTo(a),
                    keyBuilder: (context, key) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 16, left: 24),
                          child: Text(
                            DateFormat.yMd().format(key),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    },
                    itemBuilder: (context, item) {
                      final originator = item.person1IsOriginator
                          ? book.person1
                          : book.person2;
                      final beneficiary = item.split
                          ? '${book.person1} & ${book.person2}'
                          : item.person1IsOriginator
                              ? book.person2
                              : book.person1;

                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          tileColor: Colors.white,
                          title: Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Row(
                              children: [
                                Text(
                                  item.title,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          subtitle: Row(
                            children: [
                              Text(
                                originator,
                                style: TextStyle(
                                  color:
                                      item.payement ? Colors.green : Colors.red,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                beneficiary,
                                style: TextStyle(
                                  color:
                                      item.payement ? Colors.red : Colors.green,
                                ),
                              ),
                            ],
                          ),
                          trailing: Amount(item, book.currency),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => const Center(child: Text('Error')),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

class Amount extends StatelessWidget {
  const Amount(
    this.item,
    this.bookCurrency, {
    super.key,
  });

  final Transaction item;
  final String bookCurrency;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 110,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const VerticalDivider(),
          const Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${item.convertedAmount.toStringAsFixed(2)} $bookCurrency',
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),
              if (item.currency != bookCurrency)
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    '${item.amount.toStringAsFixed(2)} ${item.currency}',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
