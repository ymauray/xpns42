import 'package:freezed_annotation/freezed_annotation.dart';

part 'expense_form_state.freezed.dart';
part 'expense_form_state.g.dart';

@freezed
class ExpenseFormState with _$ExpenseFormState {
  const factory ExpenseFormState({
    DateTime? date,
    String? title,
    double? amount,
  }) = _ExpenseFormState;

  factory ExpenseFormState.fromJson(Map<String, dynamic> json) =>
      _$ExpenseFormStateFromJson(json);
}
