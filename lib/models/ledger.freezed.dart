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
  String get title => throw _privateConstructorUsedError;
  String get firstPerson => throw _privateConstructorUsedError;
  String get secondPerson => throw _privateConstructorUsedError;
  String get shortCode => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;
  bool get locked => throw _privateConstructorUsedError;
  bool get known => throw _privateConstructorUsedError;

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
      {String title,
      String firstPerson,
      String secondPerson,
      String shortCode,
      String? password,
      bool locked,
      bool known});
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
    Object? title = null,
    Object? firstPerson = null,
    Object? secondPerson = null,
    Object? shortCode = null,
    Object? password = freezed,
    Object? locked = null,
    Object? known = null,
  }) {
    return _then(_value.copyWith(
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
      shortCode: null == shortCode
          ? _value.shortCode
          : shortCode // ignore: cast_nullable_to_non_nullable
              as String,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      locked: null == locked
          ? _value.locked
          : locked // ignore: cast_nullable_to_non_nullable
              as bool,
      known: null == known
          ? _value.known
          : known // ignore: cast_nullable_to_non_nullable
              as bool,
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
      {String title,
      String firstPerson,
      String secondPerson,
      String shortCode,
      String? password,
      bool locked,
      bool known});
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
    Object? title = null,
    Object? firstPerson = null,
    Object? secondPerson = null,
    Object? shortCode = null,
    Object? password = freezed,
    Object? locked = null,
    Object? known = null,
  }) {
    return _then(_$LedgerImpl(
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
      shortCode: null == shortCode
          ? _value.shortCode
          : shortCode // ignore: cast_nullable_to_non_nullable
              as String,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      locked: null == locked
          ? _value.locked
          : locked // ignore: cast_nullable_to_non_nullable
              as bool,
      known: null == known
          ? _value.known
          : known // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LedgerImpl implements _Ledger {
  const _$LedgerImpl(
      {required this.title,
      required this.firstPerson,
      required this.secondPerson,
      required this.shortCode,
      this.password,
      this.locked = true,
      this.known = false});

  factory _$LedgerImpl.fromJson(Map<String, dynamic> json) =>
      _$$LedgerImplFromJson(json);

  @override
  final String title;
  @override
  final String firstPerson;
  @override
  final String secondPerson;
  @override
  final String shortCode;
  @override
  final String? password;
  @override
  @JsonKey()
  final bool locked;
  @override
  @JsonKey()
  final bool known;

  @override
  String toString() {
    return 'Ledger(title: $title, firstPerson: $firstPerson, secondPerson: $secondPerson, shortCode: $shortCode, password: $password, locked: $locked, known: $known)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LedgerImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.firstPerson, firstPerson) ||
                other.firstPerson == firstPerson) &&
            (identical(other.secondPerson, secondPerson) ||
                other.secondPerson == secondPerson) &&
            (identical(other.shortCode, shortCode) ||
                other.shortCode == shortCode) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.locked, locked) || other.locked == locked) &&
            (identical(other.known, known) || other.known == known));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, firstPerson, secondPerson,
      shortCode, password, locked, known);

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
      {required final String title,
      required final String firstPerson,
      required final String secondPerson,
      required final String shortCode,
      final String? password,
      final bool locked,
      final bool known}) = _$LedgerImpl;

  factory _Ledger.fromJson(Map<String, dynamic> json) = _$LedgerImpl.fromJson;

  @override
  String get title;
  @override
  String get firstPerson;
  @override
  String get secondPerson;
  @override
  String get shortCode;
  @override
  String? get password;
  @override
  bool get locked;
  @override
  bool get known;
  @override
  @JsonKey(ignore: true)
  _$$LedgerImplCopyWith<_$LedgerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
