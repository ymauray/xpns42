import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:xpns42/provider/books_provider.dart';
import 'package:xpns42/widget/header.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final book = ref.watch(booksProvider);

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: book.when(
        data: (book) => Column(
          children: [
            SafeArea(
              child: Header(book: book),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: ListView.builder(
                  itemCount: book.transactions.length,
                  itemBuilder: (context, index) {
                    final t = book.transactions[index];
                    final originator =
                        t.person1IsOriginator ? book.person1 : book.person2;
                    final beneficiary = t.split
                        ? '${book.person1} & ${book.person2}'
                        : t.person1IsOriginator
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
                                t.title,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: Text(
                                  DateFormat.yMd().format(t.date),
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
                                color: t.payement ? Colors.green : Colors.red,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              beneficiary,
                              style: TextStyle(
                                color: t.payement ? Colors.red : Colors.green,
                              ),
                            ),
                          ],
                        ),
                        trailing: SizedBox(
                          width: 70,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const VerticalDivider(),
                              const Spacer(),
                              Text(
                                t.amount.toStringAsFixed(2),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
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
