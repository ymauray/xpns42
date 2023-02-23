// ignore_for_file: public_member_api_docs, sort_constructors_first
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
    required this.currency,
    required this.transactions,
  });
  factory Book.fromMap(Map<String, dynamic> map) {
    return Book(
      person1: map['person1'] as String,
      person2: map['person2'] as String,
      balance: map['balance'] as double,
      currency: map['currency'] as String,
      transactions: List<Transaction>.from(
        (map['transactions'] as List<int>).map<Transaction>(
          (x) => Transaction.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  factory Book.fromJson(String source) =>
      Book.fromMap(json.decode(source) as Map<String, dynamic>);

  String get debtor => balance >= 0 ? person1 : person2;
  String get creditor => balance < 0 ? person1 : person2;
  String get debtorAmount =>
      balance >= 0 ? balance.toString() : (-balance).toString();

  final String person1;
  final String person2;
  final double balance;
  final String currency;
  final List<Transaction> transactions;

  Book copyWith({
    String? person1,
    String? person2,
    double? balance,
    String? currency,
    List<Transaction>? transactions,
  }) {
    return Book(
      person1: person1 ?? this.person1,
      person2: person2 ?? this.person2,
      balance: balance ?? this.balance,
      currency: currency ?? this.currency,
      transactions: transactions ?? this.transactions,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'person1': person1,
      'person2': person2,
      'balance': balance,
      'currency': currency,
      'transactions': transactions.map((x) => x.toMap()).toList(),
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'Book(person1: $person1, person2: $person2, balance: $balance, currency: $currency, transactions: $transactions)';
  }

  @override
  bool operator ==(covariant Book other) {
    if (identical(this, other)) return true;

    return other.person1 == person1 &&
        other.person2 == person2 &&
        other.balance == balance &&
        other.currency == currency &&
        listEquals(other.transactions, transactions);
  }

  @override
  int get hashCode {
    return person1.hashCode ^
        person2.hashCode ^
        balance.hashCode ^
        currency.hashCode ^
        transactions.hashCode;
  }
}
