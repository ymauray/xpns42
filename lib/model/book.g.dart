// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Book _$$_BookFromJson(Map<String, dynamic> json) => _$_Book(
      title: json['title'] as String,
      firstPerson: json['firstPerson'] as String,
      secondPerson: json['secondPerson'] as String,
      currency: json['currency'] as String,
      balance: (json['balance'] as num?)?.toDouble(),
      id: json['id'] as String?,
    );

Map<String, dynamic> _$$_BookToJson(_$_Book instance) => <String, dynamic>{
      'title': instance.title,
      'firstPerson': instance.firstPerson,
      'secondPerson': instance.secondPerson,
      'currency': instance.currency,
      'balance': instance.balance,
      'id': instance.id,
    };
