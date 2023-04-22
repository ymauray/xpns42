// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:xpns42/model/participant.dart';

class Operation {
  final String title;
  final double amount;
  final DateTime date;
  final Participant from;
  final List<Participant> to;
  Operation({
    required this.title,
    required this.amount,
    required this.date,
    required this.from,
    required this.to,
  });

  Operation copyWith({
    String? title,
    double? amount,
    DateTime? date,
    Participant? from,
    List<Participant>? to,
  }) {
    return Operation(
      title: title ?? this.title,
      amount: amount ?? this.amount,
      date: date ?? this.date,
      from: from ?? this.from,
      to: to ?? this.to,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'amount': amount,
      'date': date.millisecondsSinceEpoch,
      'from': from.toMap(),
      'to': to.map((x) => x.toMap()).toList(),
    };
  }

  factory Operation.fromMap(Map<String, dynamic> map) {
    return Operation(
      title: map['title'] as String,
      amount: map['amount'] as double,
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
      from: Participant.fromMap(map['from'] as Map<String, dynamic>),
      to: List<Participant>.from(
        (map['to'] as List<int>).map<Participant>(
          (x) => Participant.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Operation.fromJson(String source) =>
      Operation.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Operation(title: $title, amount: $amount, date: $date, from: $from, to: $to)';
  }

  @override
  bool operator ==(covariant Operation other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.amount == amount &&
        other.date == date &&
        other.from == from &&
        listEquals(other.to, to);
  }

  @override
  int get hashCode {
    return title.hashCode ^
        amount.hashCode ^
        date.hashCode ^
        from.hashCode ^
        to.hashCode;
  }
}
