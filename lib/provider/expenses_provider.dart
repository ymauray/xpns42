import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:xpns42/model/expense.dart';

part 'expenses_provider.g.dart';

@riverpod
class Expenses extends _$Expenses {
  @override
  FutureOr<List<Expense>> build(String? bookId) async {
    return _fetchExpenses();
  }

  FutureOr<List<Expense>> _fetchExpenses() async {
    return [];
  }

  void addExpense() {
    final id = bookId;
  }
}
