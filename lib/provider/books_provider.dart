import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpns42/model/book.dart';
import 'package:xpns42/model/transaction.dart';

final booksProvider = FutureProvider(
  (ref) => Future.delayed(const Duration(seconds: 3), () {
    final book = Book(
      person1: 'Yannick',
      person2: 'Sandrine',
      balance: -1358.25,
      currency: 'CHF',
      transactions: [
        Transaction(
          id: 0,
          title: 'Lidl',
          amount: 25,
          currency: 'EUR',
          convertedAmount: 25 * 1.05,
          date: DateTime(2023, 2, 22),
          payement: false,
          person1IsOriginator: true,
          split: false,
        ),
        Transaction(
          id: 1,
          title: 'Nextflix december',
          amount: 125.55,
          currency: 'CHF',
          convertedAmount: 125.55,
          date: DateTime(2023, 2, 21),
          payement: true,
          person1IsOriginator: true,
          split: true,
        ),
        Transaction(
          id: 2,
          title: 'Coop',
          amount: 123.54,
          currency: 'EUR',
          convertedAmount: 123.54 * 1.05,
          date: DateTime(2023, 2, 14),
          payement: false,
          person1IsOriginator: true,
          split: false,
        ),
        Transaction(
          id: 3,
          title: 'Migros',
          amount: 25.25,
          currency: 'EUR',
          convertedAmount: 25.25 * 1.05,
          date: DateTime(2023, 2, 7),
          payement: false,
          person1IsOriginator: true,
          split: false,
        ),
        Transaction(
          id: 4,
          title: 'Intermarché',
          amount: 25.50,
          currency: 'EUR',
          convertedAmount: 25.50 * 1.05,
          date: DateTime(2023, 1, 31),
          payement: false,
          person1IsOriginator: true,
          split: false,
        ),
        Transaction(
          id: 5,
          title: 'Bricomarché',
          amount: 79.24,
          currency: 'EUR',
          convertedAmount: 79.24 * 1.05,
          date: DateTime(2023, 1, 24),
          payement: false,
          person1IsOriginator: true,
          split: false,
        ),
      ],
    );

    return book;
  }),
);
