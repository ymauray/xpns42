// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:xpns42/model/operation.dart';

part 'book.freezed.dart';

@freezed
class Book with _$Book {
  const factory Book({
    required int id,
    required String title,
    required String currency,
    required double initialBalance,
    required double currentBalance,
    required List<Operation> operations,
  }) = _Book;
}
