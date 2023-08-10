// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ledger_proxy.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LedgerProxy _$LedgerProxyFromJson(Map<String, dynamic> json) {
  return _LedgerProxy.fromJson(json);
}

/// @nodoc
mixin _$LedgerProxy {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LedgerProxyCopyWith<LedgerProxy> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LedgerProxyCopyWith<$Res> {
  factory $LedgerProxyCopyWith(
          LedgerProxy value, $Res Function(LedgerProxy) then) =
      _$LedgerProxyCopyWithImpl<$Res, LedgerProxy>;
  @useResult
  $Res call({String id, String title});
}

/// @nodoc
class _$LedgerProxyCopyWithImpl<$Res, $Val extends LedgerProxy>
    implements $LedgerProxyCopyWith<$Res> {
  _$LedgerProxyCopyWithImpl(this._value, this._then);

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
abstract class _$$_LedgerProxyCopyWith<$Res>
    implements $LedgerProxyCopyWith<$Res> {
  factory _$$_LedgerProxyCopyWith(
          _$_LedgerProxy value, $Res Function(_$_LedgerProxy) then) =
      __$$_LedgerProxyCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String title});
}

/// @nodoc
class __$$_LedgerProxyCopyWithImpl<$Res>
    extends _$LedgerProxyCopyWithImpl<$Res, _$_LedgerProxy>
    implements _$$_LedgerProxyCopyWith<$Res> {
  __$$_LedgerProxyCopyWithImpl(
      _$_LedgerProxy _value, $Res Function(_$_LedgerProxy) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
  }) {
    return _then(_$_LedgerProxy(
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
class _$_LedgerProxy implements _LedgerProxy {
  const _$_LedgerProxy({required this.id, required this.title});

  factory _$_LedgerProxy.fromJson(Map<String, dynamic> json) =>
      _$$_LedgerProxyFromJson(json);

  @override
  final String id;
  @override
  final String title;

  @override
  String toString() {
    return 'LedgerProxy(id: $id, title: $title)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LedgerProxy &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LedgerProxyCopyWith<_$_LedgerProxy> get copyWith =>
      __$$_LedgerProxyCopyWithImpl<_$_LedgerProxy>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LedgerProxyToJson(
      this,
    );
  }
}

abstract class _LedgerProxy implements LedgerProxy {
  const factory _LedgerProxy(
      {required final String id, required final String title}) = _$_LedgerProxy;

  factory _LedgerProxy.fromJson(Map<String, dynamic> json) =
      _$_LedgerProxy.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  @JsonKey(ignore: true)
  _$$_LedgerProxyCopyWith<_$_LedgerProxy> get copyWith =>
      throw _privateConstructorUsedError;
}
