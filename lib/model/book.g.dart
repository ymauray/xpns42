// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Book _$$_BookFromJson(Map<String, dynamic> json) => _$_Book(
      title: json['title'] as String,
      balance: (json['balance'] as num).toDouble(),
      firstPerson: json['firstPerson'] as String?,
      secondPerson: json['secondPerson'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$$_BookToJson(_$_Book instance) => <String, dynamic>{
      'title': instance.title,
      'balance': instance.balance,
      'firstPerson': instance.firstPerson,
      'secondPerson': instance.secondPerson,
      'id': instance.id,
    };
