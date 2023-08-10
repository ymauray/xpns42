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
  String get shortCode => throw _privateConstructorUsedError;
  String get encryptedId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get firstPerson => throw _privateConstructorUsedError;
  String get secondPerson => throw _privateConstructorUsedError;

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
      String shortCode,
      String encryptedId,
      String title,
      String firstPerson,
      String secondPerson});
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
    Object? shortCode = null,
    Object? encryptedId = null,
    Object? title = null,
    Object? firstPerson = null,
    Object? secondPerson = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      shortCode: null == shortCode
          ? _value.shortCode
          : shortCode // ignore: cast_nullable_to_non_nullable
              as String,
      encryptedId: null == encryptedId
          ? _value.encryptedId
          : encryptedId // ignore: cast_nullable_to_non_nullable
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LedgerCopyWith<$Res> implements $LedgerCopyWith<$Res> {
  factory _$$_LedgerCopyWith(_$_Ledger value, $Res Function(_$_Ledger) then) =
      __$$_LedgerCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String shortCode,
      String encryptedId,
      String title,
      String firstPerson,
      String secondPerson});
}

/// @nodoc
class __$$_LedgerCopyWithImpl<$Res>
    extends _$LedgerCopyWithImpl<$Res, _$_Ledger>
    implements _$$_LedgerCopyWith<$Res> {
  __$$_LedgerCopyWithImpl(_$_Ledger _value, $Res Function(_$_Ledger) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? shortCode = null,
    Object? encryptedId = null,
    Object? title = null,
    Object? firstPerson = null,
    Object? secondPerson = null,
  }) {
    return _then(_$_Ledger(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      shortCode: null == shortCode
          ? _value.shortCode
          : shortCode // ignore: cast_nullable_to_non_nullable
              as String,
      encryptedId: null == encryptedId
          ? _value.encryptedId
          : encryptedId // ignore: cast_nullable_to_non_nullable
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Ledger implements _Ledger {
  const _$_Ledger(
      {required this.id,
      required this.shortCode,
      required this.encryptedId,
      required this.title,
      required this.firstPerson,
      required this.secondPerson});

  factory _$_Ledger.fromJson(Map<String, dynamic> json) =>
      _$$_LedgerFromJson(json);

  @override
  final String id;
  @override
  final String shortCode;
  @override
  final String encryptedId;
  @override
  final String title;
  @override
  final String firstPerson;
  @override
  final String secondPerson;

  @override
  String toString() {
    return 'Ledger(id: $id, shortCode: $shortCode, encryptedId: $encryptedId, title: $title, firstPerson: $firstPerson, secondPerson: $secondPerson)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Ledger &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.shortCode, shortCode) ||
                other.shortCode == shortCode) &&
            (identical(other.encryptedId, encryptedId) ||
                other.encryptedId == encryptedId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.firstPerson, firstPerson) ||
                other.firstPerson == firstPerson) &&
            (identical(other.secondPerson, secondPerson) ||
                other.secondPerson == secondPerson));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, shortCode, encryptedId,
      title, firstPerson, secondPerson);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LedgerCopyWith<_$_Ledger> get copyWith =>
      __$$_LedgerCopyWithImpl<_$_Ledger>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LedgerToJson(
      this,
    );
  }
}

abstract class _Ledger implements Ledger {
  const factory _Ledger(
      {required final String id,
      required final String shortCode,
      required final String encryptedId,
      required final String title,
      required final String firstPerson,
      required final String secondPerson}) = _$_Ledger;

  factory _Ledger.fromJson(Map<String, dynamic> json) = _$_Ledger.fromJson;

  @override
  String get id;
  @override
  String get shortCode;
  @override
  String get encryptedId;
  @override
  String get title;
  @override
  String get firstPerson;
  @override
  String get secondPerson;
  @override
  @JsonKey(ignore: true)
  _$$_LedgerCopyWith<_$_Ledger> get copyWith =>
      throw _privateConstructorUsedError;
}
