// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ledger.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LedgerImpl _$$LedgerImplFromJson(Map<String, dynamic> json) => _$LedgerImpl(
      title: json['title'] as String,
      firstPerson: json['firstPerson'] as String,
      secondPerson: json['secondPerson'] as String,
      shortCode: json['shortCode'] as String,
      password: json['password'] as String,
      currency: json['currency'] as String,
    );

Map<String, dynamic> _$$LedgerImplToJson(_$LedgerImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'firstPerson': instance.firstPerson,
      'secondPerson': instance.secondPerson,
      'shortCode': instance.shortCode,
      'password': instance.password,
      'currency': instance.currency,
    };
