abstract class Entity {
  Map<String, dynamic> toMap();
  int? get id;
  String get createdAt;
  String get updatedAt;
}
