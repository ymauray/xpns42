// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ledger.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LedgerImpl _$$LedgerImplFromJson(Map<String, dynamic> json) => _$LedgerImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      firstPerson: json['firstPerson'] as String,
      secondPerson: json['secondPerson'] as String,
      balance: (json['balance'] as num?)?.toDouble() ?? 0.0,
      references: json['references'] as int? ?? 1,
      sortOrder: json['sortOrder'] as int? ?? 9999,
    );

Map<String, dynamic> _$$LedgerImplToJson(_$LedgerImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'firstPerson': instance.firstPerson,
      'secondPerson': instance.secondPerson,
      'balance': instance.balance,
      'references': instance.references,
      'sortOrder': instance.sortOrder,
    };
