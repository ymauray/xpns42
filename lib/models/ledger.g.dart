// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ledger.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Ledger _$$_LedgerFromJson(Map<String, dynamic> json) => _$_Ledger(
      id: json['id'] as String,
      shortCode: json['shortCode'] as String,
      encryptedId: json['encryptedId'] as String,
      title: json['title'] as String,
      firstPerson: json['firstPerson'] as String,
      secondPerson: json['secondPerson'] as String,
    );

Map<String, dynamic> _$$_LedgerToJson(_$_Ledger instance) => <String, dynamic>{
      'id': instance.id,
      'shortCode': instance.shortCode,
      'encryptedId': instance.encryptedId,
      'title': instance.title,
      'firstPerson': instance.firstPerson,
      'secondPerson': instance.secondPerson,
    };
