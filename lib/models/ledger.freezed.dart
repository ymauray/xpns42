// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ledger.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Ledger _$LedgerFromJson(Map<String, dynamic> json) {
  return _Ledger.fromJson(json);
}

/// @nodoc
mixin _$Ledger {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get firstPerson => throw _privateConstructorUsedError;
  String get secondPerson => throw _privateConstructorUsedError;
  double get balance => throw _privateConstructorUsedError;
  int get references => throw _privateConstructorUsedError;
  int get sortOrder => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LedgerCopyWith<Ledger> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LedgerCopyWith<$Res> {
  factory $LedgerCopyWith(Ledger value, $Res Function(Ledger) then) =
      _$LedgerCopyWithImpl<$Res, Ledger>;
  @useResult
  $Res call(
      {String id,
      String title,
      String firstPerson,
      String secondPerson,
      double balance,
      int references,
      int sortOrder});
}

/// @nodoc
class _$LedgerCopyWithImpl<$Res, $Val extends Ledger>
    implements $LedgerCopyWith<$Res> {
  _$LedgerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? firstPerson = null,
    Object? secondPerson = null,
    Object? balance = null,
    Object? references = null,
    Object? sortOrder = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      firstPerson: null == firstPerson
          ? _value.firstPerson
          : firstPerson // ignore: cast_nullable_to_non_nullable
              as String,
      secondPerson: null == secondPerson
          ? _value.secondPerson
          : secondPerson // ignore: cast_nullable_to_non_nullable
              as String,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
      references: null == references
          ? _value.references
          : references // ignore: cast_nullable_to_non_nullable
              as int,
      sortOrder: null == sortOrder
          ? _value.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LedgerImplCopyWith<$Res> implements $LedgerCopyWith<$Res> {
  factory _$$LedgerImplCopyWith(
          _$LedgerImpl value, $Res Function(_$LedgerImpl) then) =
      __$$LedgerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String firstPerson,
      String secondPerson,
      double balance,
      int references,
      int sortOrder});
}

/// @nodoc
class __$$LedgerImplCopyWithImpl<$Res>
    extends _$LedgerCopyWithImpl<$Res, _$LedgerImpl>
    implements _$$LedgerImplCopyWith<$Res> {
  __$$LedgerImplCopyWithImpl(
      _$LedgerImpl _value, $Res Function(_$LedgerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? firstPerson = null,
    Object? secondPerson = null,
    Object? balance = null,
    Object? references = null,
    Object? sortOrder = null,
  }) {
    return _then(_$LedgerImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      firstPerson: null == firstPerson
          ? _value.firstPerson
          : firstPerson // ignore: cast_nullable_to_non_nullable
              as String,
      secondPerson: null == secondPerson
          ? _value.secondPerson
          : secondPerson // ignore: cast_nullable_to_non_nullable
              as String,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
      references: null == references
          ? _value.references
          : references // ignore: cast_nullable_to_non_nullable
              as int,
      sortOrder: null == sortOrder
          ? _value.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LedgerImpl implements _Ledger {
  const _$LedgerImpl(
      {required this.id,
      required this.title,
      required this.firstPerson,
      required this.secondPerson,
      this.balance = 0.0,
      this.references = 1,
      this.sortOrder = 9999});

  factory _$LedgerImpl.fromJson(Map<String, dynamic> json) =>
      _$$LedgerImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String firstPerson;
  @override
  final String secondPerson;
  @override
  @JsonKey()
  final double balance;
  @override
  @JsonKey()
  final int references;
  @override
  @JsonKey()
  final int sortOrder;

  @override
  String toString() {
    return 'Ledger(id: $id, title: $title, firstPerson: $firstPerson, secondPerson: $secondPerson, balance: $balance, references: $references, sortOrder: $sortOrder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LedgerImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.firstPerson, firstPerson) ||
                other.firstPerson == firstPerson) &&
            (identical(other.secondPerson, secondPerson) ||
                other.secondPerson == secondPerson) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.references, references) ||
                other.references == references) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, firstPerson,
      secondPerson, balance, references, sortOrder);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LedgerImplCopyWith<_$LedgerImpl> get copyWith =>
      __$$LedgerImplCopyWithImpl<_$LedgerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LedgerImplToJson(
      this,
    );
  }
}

abstract class _Ledger implements Ledger {
  const factory _Ledger(
      {required final String id,
      required final String title,
      required final String firstPerson,
      required final String secondPerson,
      final double balance,
      final int references,
      final int sortOrder}) = _$LedgerImpl;

  factory _Ledger.fromJson(Map<String, dynamic> json) = _$LedgerImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get firstPerson;
  @override
  String get secondPerson;
  @override
  double get balance;
  @override
  int get references;
  @override
  int get sortOrder;
  @override
  @JsonKey(ignore: true)
  _$$LedgerImplCopyWith<_$LedgerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
