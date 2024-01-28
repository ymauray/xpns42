// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_page_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginPageStateImpl _$$LoginPageStateImplFromJson(Map<String, dynamic> json) =>
    _$LoginPageStateImpl(
      showRegistrationForm: json['showRegistrationForm'] as bool,
      firstName: json['firstName'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$$LoginPageStateImplToJson(
        _$LoginPageStateImpl instance) =>
    <String, dynamic>{
      'showRegistrationForm': instance.showRegistrationForm,
      'firstName': instance.firstName,
      'email': instance.email,
      'password': instance.password,
    };
