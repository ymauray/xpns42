import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:xpns42/model/expense_form_state.dart';

part 'expense_form_state_provider.g.dart';

@riverpod
class ExpenseForm extends _$ExpenseForm {
  @override
  ExpenseFormState build() {
    return const ExpenseFormState();
  }
}
