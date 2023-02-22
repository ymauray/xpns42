import 'package:flutter/material.dart';
import 'package:xpns42/model/book.dart';

class Header extends StatelessWidget {
  const Header({
    required this.book,
    super.key,
  });

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: DecoratedBox(
            decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(32),
              ),
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.blue.shade700,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Center(
                          child: Column(
                            children: [
                              Text(
                                '${book.debtor} owes',
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 16,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: Text(
                                  book.debtorAmount,
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 40,
                                  ),
                                ),
                              ),
                              Text(
                                'to ${book.creditor}',
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all<EdgeInsets>(
                                  const EdgeInsets.all(24),
                                ),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                ),
                                backgroundColor: MaterialStateColor.resolveWith(
                                  (states) => Colors.white,
                                ),
                                foregroundColor: MaterialStateColor.resolveWith(
                                  (states) => Colors.black,
                                ),
                              ),
                              child: const Text(
                                'Add expense',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
