// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_ledger.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LocalLedgerImpl _$$LocalLedgerImplFromJson(Map<String, dynamic> json) =>
    _$LocalLedgerImpl(
      title: json['title'] as String,
      firstPerson: json['firstPerson'] as String,
      secondPerson: json['secondPerson'] as String,
      shortCode: json['shortCode'] as String,
      password: json['password'] as String,
      currency: json['currency'] as String,
    );

Map<String, dynamic> _$$LocalLedgerImplToJson(_$LocalLedgerImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'firstPerson': instance.firstPerson,
      'secondPerson': instance.secondPerson,
      'shortCode': instance.shortCode,
      'password': instance.password,
      'currency': instance.currency,
    };
