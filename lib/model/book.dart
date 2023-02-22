import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:xpns42/model/transaction.dart';

// ignore_for_file: argument_type_not_assignable
// ignore_for_file: avoid_dynamic_calls
// ignore_for_file: lines_longer_than_80_chars

@immutable
class Book {
  const Book({
    required this.person1,
    required this.person2,
    required this.balance,
    required this.transactions,
  });
  factory Book.fromMap(Map<String, dynamic> map) {
    return Book(
      person1: map['person1'] ?? '',
      person2: map['person2'] ?? '',
      balance: map['balance']?.toDouble() ?? 0.0,
      transactions: List<Transaction>.from(
        map['transactions']?.map(Transaction.fromMap),
      ),
    );
  }

  factory Book.fromJson(String source) => Book.fromMap(json.decode(source));

  String get debtor => balance >= 0 ? person1 : person2;
  String get creditor => balance < 0 ? person1 : person2;
  String get debtorAmount =>
      balance >= 0 ? balance.toString() : (-balance).toString();

  final String person1;
  final String person2;
  final double balance;
  final List<Transaction> transactions;

  Book copyWith({
    String? person1,
    String? person2,
    double? balance,
    List<Transaction>? transactions,
  }) {
    return Book(
      person1: person1 ?? this.person1,
      person2: person2 ?? this.person2,
      balance: balance ?? this.balance,
      transactions: transactions ?? this.transactions,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'person1': person1,
      'person2': person2,
      'balance': balance,
      'transactions': transactions.map((x) => x.toMap()).toList(),
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'Book(person1: $person1, person2: $person2, balance: $balance, transactions: $transactions)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Book &&
        other.person1 == person1 &&
        other.person2 == person2 &&
        other.balance == balance &&
        listEquals(other.transactions, transactions);
  }

  @override
  int get hashCode {
    return person1.hashCode ^
        person2.hashCode ^
        balance.hashCode ^
        transactions.hashCode;
  }
}
