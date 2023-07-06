// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_form_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ExpenseFormState _$$_ExpenseFormStateFromJson(Map<String, dynamic> json) =>
    _$_ExpenseFormState(
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      title: json['title'] as String?,
      amount: (json['amount'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_ExpenseFormStateToJson(_$_ExpenseFormState instance) =>
    <String, dynamic>{
      'date': instance.date?.toIso8601String(),
      'title': instance.title,
      'amount': instance.amount,
    };
