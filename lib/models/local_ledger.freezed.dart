// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'local_ledger.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LocalLedger _$LocalLedgerFromJson(Map<String, dynamic> json) {
  return _LocalLedger.fromJson(json);
}

/// @nodoc
mixin _$LocalLedger {
  String get title => throw _privateConstructorUsedError;
  String get firstPerson => throw _privateConstructorUsedError;
  String get secondPerson => throw _privateConstructorUsedError;
  String get shortCode => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocalLedgerCopyWith<LocalLedger> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocalLedgerCopyWith<$Res> {
  factory $LocalLedgerCopyWith(
          LocalLedger value, $Res Function(LocalLedger) then) =
      _$LocalLedgerCopyWithImpl<$Res, LocalLedger>;
  @useResult
  $Res call(
      {String title,
      String firstPerson,
      String secondPerson,
      String shortCode,
      String password});
}

/// @nodoc
class _$LocalLedgerCopyWithImpl<$Res, $Val extends LocalLedger>
    implements $LocalLedgerCopyWith<$Res> {
  _$LocalLedgerCopyWithImpl(this._value, this._then);

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
    Object? password = null,
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
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LocalLedgerImplCopyWith<$Res>
    implements $LocalLedgerCopyWith<$Res> {
  factory _$$LocalLedgerImplCopyWith(
          _$LocalLedgerImpl value, $Res Function(_$LocalLedgerImpl) then) =
      __$$LocalLedgerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      String firstPerson,
      String secondPerson,
      String shortCode,
      String password});
}

/// @nodoc
class __$$LocalLedgerImplCopyWithImpl<$Res>
    extends _$LocalLedgerCopyWithImpl<$Res, _$LocalLedgerImpl>
    implements _$$LocalLedgerImplCopyWith<$Res> {
  __$$LocalLedgerImplCopyWithImpl(
      _$LocalLedgerImpl _value, $Res Function(_$LocalLedgerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? firstPerson = null,
    Object? secondPerson = null,
    Object? shortCode = null,
    Object? password = null,
  }) {
    return _then(_$LocalLedgerImpl(
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
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LocalLedgerImpl implements _LocalLedger {
  const _$LocalLedgerImpl(
      {required this.title,
      required this.firstPerson,
      required this.secondPerson,
      required this.shortCode,
      required this.password});

  factory _$LocalLedgerImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocalLedgerImplFromJson(json);

  @override
  final String title;
  @override
  final String firstPerson;
  @override
  final String secondPerson;
  @override
  final String shortCode;
  @override
  final String password;

  @override
  String toString() {
    return 'LocalLedger(title: $title, firstPerson: $firstPerson, secondPerson: $secondPerson, shortCode: $shortCode, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocalLedgerImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.firstPerson, firstPerson) ||
                other.firstPerson == firstPerson) &&
            (identical(other.secondPerson, secondPerson) ||
                other.secondPerson == secondPerson) &&
            (identical(other.shortCode, shortCode) ||
                other.shortCode == shortCode) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, title, firstPerson, secondPerson, shortCode, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LocalLedgerImplCopyWith<_$LocalLedgerImpl> get copyWith =>
      __$$LocalLedgerImplCopyWithImpl<_$LocalLedgerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LocalLedgerImplToJson(
      this,
    );
  }
}

abstract class _LocalLedger implements LocalLedger {
  const factory _LocalLedger(
      {required final String title,
      required final String firstPerson,
      required final String secondPerson,
      required final String shortCode,
      required final String password}) = _$LocalLedgerImpl;

  factory _LocalLedger.fromJson(Map<String, dynamic> json) =
      _$LocalLedgerImpl.fromJson;

  @override
  String get title;
  @override
  String get firstPerson;
  @override
  String get secondPerson;
  @override
  String get shortCode;
  @override
  String get password;
  @override
  @JsonKey(ignore: true)
  _$$LocalLedgerImplCopyWith<_$LocalLedgerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
