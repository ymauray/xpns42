import 'package:flutter/material.dart';
import 'package:xpns42/util/colors.dart';
import 'package:xpns42/model/book.dart';
import 'package:xpns42/page/home/add_expense_button.dart';
import 'package:xpns42/page/home/balance.dart';

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
            decoration: BoxDecoration(
              color: AppColors.header,
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(32),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Balance(book: book),
                  const AddExpenseButton(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
