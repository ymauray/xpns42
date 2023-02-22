// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

// ignore_for_file: argument_type_not_assignable
// ignore_for_file: avoid_dynamic_calls
// ignore_for_file: lines_longer_than_80_chars

@immutable
class Transaction {
  const Transaction({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
    required this.payement,
    required this.person1IsOriginator,
    required this.split,
  });

  factory Transaction.fromMap(Map<String, dynamic> map) {
    return Transaction(
      id: map['id'] as int,
      title: map['title'] as String,
      amount: map['amount'] as double,
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
      payement: map['payement'] as bool,
      person1IsOriginator: map['persone1IsOriginator'] as bool,
      split: map['split'] as bool,
    );
  }
  factory Transaction.fromJson(String source) =>
      Transaction.fromMap(json.decode(source) as Map<String, dynamic>);
  final int id;
  final String title;
  final double amount;
  final DateTime date;
  final bool payement;
  final bool person1IsOriginator;
  final bool split;

  Transaction copyWith({
    int? id,
    String? title,
    double? amount,
    DateTime? date,
    bool? payement,
    bool? persone1IsOriginator,
    bool? split,
  }) {
    return Transaction(
      id: id ?? this.id,
      title: title ?? this.title,
      amount: amount ?? this.amount,
      date: date ?? this.date,
      payement: payement ?? this.payement,
      person1IsOriginator: persone1IsOriginator ?? person1IsOriginator,
      split: split ?? this.split,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'amount': amount,
      'date': date.millisecondsSinceEpoch,
      'payement': payement,
      'persone1IsOriginator': person1IsOriginator,
      'split': split,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'Transaction(id: $id, title: $title, amount: $amount, date: $date, payement: $payement, persone1IsOriginator: $person1IsOriginator, split: $split)';
  }

  @override
  bool operator ==(covariant Transaction other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.amount == amount &&
        other.date == date &&
        other.payement == payement &&
        other.person1IsOriginator == person1IsOriginator &&
        other.split == split;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        amount.hashCode ^
        date.hashCode ^
        payement.hashCode ^
        person1IsOriginator.hashCode ^
        split.hashCode;
  }
}
