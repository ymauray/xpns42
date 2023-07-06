// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'expense_form_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ExpenseFormState _$ExpenseFormStateFromJson(Map<String, dynamic> json) {
  return _ExpenseFormState.fromJson(json);
}

/// @nodoc
mixin _$ExpenseFormState {
  DateTime? get date => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  double? get amount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExpenseFormStateCopyWith<ExpenseFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExpenseFormStateCopyWith<$Res> {
  factory $ExpenseFormStateCopyWith(
          ExpenseFormState value, $Res Function(ExpenseFormState) then) =
      _$ExpenseFormStateCopyWithImpl<$Res, ExpenseFormState>;
  @useResult
  $Res call({DateTime? date, String? title, double? amount});
}

/// @nodoc
class _$ExpenseFormStateCopyWithImpl<$Res, $Val extends ExpenseFormState>
    implements $ExpenseFormStateCopyWith<$Res> {
  _$ExpenseFormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = freezed,
    Object? title = freezed,
    Object? amount = freezed,
  }) {
    return _then(_value.copyWith(
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ExpenseFormStateCopyWith<$Res>
    implements $ExpenseFormStateCopyWith<$Res> {
  factory _$$_ExpenseFormStateCopyWith(
          _$_ExpenseFormState value, $Res Function(_$_ExpenseFormState) then) =
      __$$_ExpenseFormStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime? date, String? title, double? amount});
}

/// @nodoc
class __$$_ExpenseFormStateCopyWithImpl<$Res>
    extends _$ExpenseFormStateCopyWithImpl<$Res, _$_ExpenseFormState>
    implements _$$_ExpenseFormStateCopyWith<$Res> {
  __$$_ExpenseFormStateCopyWithImpl(
      _$_ExpenseFormState _value, $Res Function(_$_ExpenseFormState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = freezed,
    Object? title = freezed,
    Object? amount = freezed,
  }) {
    return _then(_$_ExpenseFormState(
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ExpenseFormState implements _ExpenseFormState {
  const _$_ExpenseFormState({this.date, this.title, this.amount});

  factory _$_ExpenseFormState.fromJson(Map<String, dynamic> json) =>
      _$$_ExpenseFormStateFromJson(json);

  @override
  final DateTime? date;
  @override
  final String? title;
  @override
  final double? amount;

  @override
  String toString() {
    return 'ExpenseFormState(date: $date, title: $title, amount: $amount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ExpenseFormState &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, date, title, amount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ExpenseFormStateCopyWith<_$_ExpenseFormState> get copyWith =>
      __$$_ExpenseFormStateCopyWithImpl<_$_ExpenseFormState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ExpenseFormStateToJson(
      this,
    );
  }
}

abstract class _ExpenseFormState implements ExpenseFormState {
  const factory _ExpenseFormState(
      {final DateTime? date,
      final String? title,
      final double? amount}) = _$_ExpenseFormState;

  factory _ExpenseFormState.fromJson(Map<String, dynamic> json) =
      _$_ExpenseFormState.fromJson;

  @override
  DateTime? get date;
  @override
  String? get title;
  @override
  double? get amount;
  @override
  @JsonKey(ignore: true)
  _$$_ExpenseFormStateCopyWith<_$_ExpenseFormState> get copyWith =>
      throw _privateConstructorUsedError;
}
