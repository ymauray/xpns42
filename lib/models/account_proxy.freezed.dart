// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_proxy.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AccountProxy _$AccountProxyFromJson(Map<String, dynamic> json) {
  return _AccountProxy.fromJson(json);
}

/// @nodoc
mixin _$AccountProxy {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AccountProxyCopyWith<AccountProxy> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountProxyCopyWith<$Res> {
  factory $AccountProxyCopyWith(
          AccountProxy value, $Res Function(AccountProxy) then) =
      _$AccountProxyCopyWithImpl<$Res, AccountProxy>;
  @useResult
  $Res call({String id, String title});
}

/// @nodoc
class _$AccountProxyCopyWithImpl<$Res, $Val extends AccountProxy>
    implements $AccountProxyCopyWith<$Res> {
  _$AccountProxyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AccountProxyCopyWith<$Res>
    implements $AccountProxyCopyWith<$Res> {
  factory _$$_AccountProxyCopyWith(
          _$_AccountProxy value, $Res Function(_$_AccountProxy) then) =
      __$$_AccountProxyCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String title});
}

/// @nodoc
class __$$_AccountProxyCopyWithImpl<$Res>
    extends _$AccountProxyCopyWithImpl<$Res, _$_AccountProxy>
    implements _$$_AccountProxyCopyWith<$Res> {
  __$$_AccountProxyCopyWithImpl(
      _$_AccountProxy _value, $Res Function(_$_AccountProxy) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
  }) {
    return _then(_$_AccountProxy(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AccountProxy implements _AccountProxy {
  const _$_AccountProxy({required this.id, required this.title});

  factory _$_AccountProxy.fromJson(Map<String, dynamic> json) =>
      _$$_AccountProxyFromJson(json);

  @override
  final String id;
  @override
  final String title;

  @override
  String toString() {
    return 'AccountProxy(id: $id, title: $title)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AccountProxy &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AccountProxyCopyWith<_$_AccountProxy> get copyWith =>
      __$$_AccountProxyCopyWithImpl<_$_AccountProxy>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AccountProxyToJson(
      this,
    );
  }
}

abstract class _AccountProxy implements AccountProxy {
  const factory _AccountProxy(
      {required final String id,
      required final String title}) = _$_AccountProxy;

  factory _AccountProxy.fromJson(Map<String, dynamic> json) =
      _$_AccountProxy.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  @JsonKey(ignore: true)
  _$$_AccountProxyCopyWith<_$_AccountProxy> get copyWith =>
      throw _privateConstructorUsedError;
}
