import 'dart:convert';

import 'entity.dart';

class Book extends Entity {
  Book(
    this.id,
    this.title,
    this.person1,
    this.person2,
    this.sortOrder,
    this.createdAt,
    this.updatedAt,
  );

  @override
  final int? id;
  final String title;
  final String person1;
  final String person2;
  final int sortOrder;
  @override
  final String createdAt;
  @override
  final String updatedAt;

  Book copyWith({
    int? id,
    String? title,
    String? person1,
    String? person2,
    int? sortOrder,
    String? createdAt,
    String? updatedAt,
  }) {
    return Book(
      id ?? this.id,
      title ?? this.title,
      person1 ?? this.person1,
      person2 ?? this.person2,
      sortOrder ?? this.sortOrder,
      createdAt ?? this.createdAt,
      updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'person1': person1,
      'person2': person2,
      'sortOrder': sortOrder,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  factory Book.fromMap(Map<String, dynamic> map) {
    return Book(
      map['id']?.toInt(),
      map['title'] ?? '',
      map['person1'] ?? '',
      map['person2'] ?? '',
      map['sortOrder']?.toInt() ?? 0,
      map['createdAt'] ?? '',
      map['updatedAt'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Book.fromJson(String source) => Book.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Book(id: $id, title: $title, person1: $person1, person2: $person2, sortOrder: $sortOrder, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Book &&
        other.id == id &&
        other.title == title &&
        other.person1 == person1 &&
        other.person2 == person2 &&
        other.sortOrder == sortOrder &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        person1.hashCode ^
        person2.hashCode ^
        sortOrder.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode;
  }
}
