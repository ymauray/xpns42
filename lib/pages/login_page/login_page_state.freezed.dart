// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LoginPageState _$LoginPageStateFromJson(Map<String, dynamic> json) {
  return _LoginPageState.fromJson(json);
}

/// @nodoc
mixin _$LoginPageState {
  bool get showRegistrationForm => throw _privateConstructorUsedError;
  String? get firstName => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoginPageStateCopyWith<LoginPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginPageStateCopyWith<$Res> {
  factory $LoginPageStateCopyWith(
          LoginPageState value, $Res Function(LoginPageState) then) =
      _$LoginPageStateCopyWithImpl<$Res, LoginPageState>;
  @useResult
  $Res call(
      {bool showRegistrationForm,
      String? firstName,
      String? email,
      String? password});
}

/// @nodoc
class _$LoginPageStateCopyWithImpl<$Res, $Val extends LoginPageState>
    implements $LoginPageStateCopyWith<$Res> {
  _$LoginPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? showRegistrationForm = null,
    Object? firstName = freezed,
    Object? email = freezed,
    Object? password = freezed,
  }) {
    return _then(_value.copyWith(
      showRegistrationForm: null == showRegistrationForm
          ? _value.showRegistrationForm
          : showRegistrationForm // ignore: cast_nullable_to_non_nullable
              as bool,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoginPageStateImplCopyWith<$Res>
    implements $LoginPageStateCopyWith<$Res> {
  factory _$$LoginPageStateImplCopyWith(_$LoginPageStateImpl value,
          $Res Function(_$LoginPageStateImpl) then) =
      __$$LoginPageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool showRegistrationForm,
      String? firstName,
      String? email,
      String? password});
}

/// @nodoc
class __$$LoginPageStateImplCopyWithImpl<$Res>
    extends _$LoginPageStateCopyWithImpl<$Res, _$LoginPageStateImpl>
    implements _$$LoginPageStateImplCopyWith<$Res> {
  __$$LoginPageStateImplCopyWithImpl(
      _$LoginPageStateImpl _value, $Res Function(_$LoginPageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? showRegistrationForm = null,
    Object? firstName = freezed,
    Object? email = freezed,
    Object? password = freezed,
  }) {
    return _then(_$LoginPageStateImpl(
      showRegistrationForm: null == showRegistrationForm
          ? _value.showRegistrationForm
          : showRegistrationForm // ignore: cast_nullable_to_non_nullable
              as bool,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoginPageStateImpl implements _LoginPageState {
  const _$LoginPageStateImpl(
      {required this.showRegistrationForm,
      this.firstName,
      this.email,
      this.password});

  factory _$LoginPageStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoginPageStateImplFromJson(json);

  @override
  final bool showRegistrationForm;
  @override
  final String? firstName;
  @override
  final String? email;
  @override
  final String? password;

  @override
  String toString() {
    return 'LoginPageState(showRegistrationForm: $showRegistrationForm, firstName: $firstName, email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginPageStateImpl &&
            (identical(other.showRegistrationForm, showRegistrationForm) ||
                other.showRegistrationForm == showRegistrationForm) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, showRegistrationForm, firstName, email, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginPageStateImplCopyWith<_$LoginPageStateImpl> get copyWith =>
      __$$LoginPageStateImplCopyWithImpl<_$LoginPageStateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoginPageStateImplToJson(
      this,
    );
  }
}

abstract class _LoginPageState implements LoginPageState {
  const factory _LoginPageState(
      {required final bool showRegistrationForm,
      final String? firstName,
      final String? email,
      final String? password}) = _$LoginPageStateImpl;

  factory _LoginPageState.fromJson(Map<String, dynamic> json) =
      _$LoginPageStateImpl.fromJson;

  @override
  bool get showRegistrationForm;
  @override
  String? get firstName;
  @override
  String? get email;
  @override
  String? get password;
  @override
  @JsonKey(ignore: true)
  _$$LoginPageStateImplCopyWith<_$LoginPageStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
