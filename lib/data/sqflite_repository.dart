import '../data/base_repository.dart';
import '../utils/sqflite_utils.dart';
import 'model/entity.dart';

typedef FromMapCallback<T> = T Function(Map<String, dynamic> map);

extension TimestampedMap on Map<String, dynamic> {
  Map<String, dynamic> timestamp({bool setCreationTime = false}) {
    var now = DateTime.now().toIso8601String();
    if (setCreationTime) {
      this['createdAt'] = now;
    }
    this['updatedAt'] = now;

    return this;
  }
}

mixin SQFLiteRepository<T extends Entity> on BaseRepository<T> {
  String get table;
  FromMapCallback<T> get fromMap;

  @override
  Future<void> create(T t) async {
    var db = await SQFLiteUtils.getDatabase();
    await db.insert(table, t.toMap().timestamp(setCreationTime: true));
  }

  @override
  Future<T> read(int id) async {
    var db = await SQFLiteUtils.getDatabase();
    var rows = await db.query(table, where: 'id = ?', whereArgs: [id]);
    var item = fromMap(rows.first);
    return item;
  }

  @override
  Future<T> update(T t) async {
    assert(t.id != null);
    var db = await SQFLiteUtils.getDatabase();
    db.update(
      table,
      t.toMap().timestamp(),
      where: 'id = ?',
      whereArgs: [t.id!],
    );
    return read(t.id!);
  }

  @override
  Future<void> delete(int id) async {
    var db = await SQFLiteUtils.getDatabase();
    db.delete(table, where: 'id = ?', whereArgs: [id]);
  }

  @override
  Future<List<T>> readAll({
    bool? distinct,
    List<String>? columns,
    String? where,
    List<Object?>? whereArgs,
    String? groupBy,
    String? having,
    String? orderBy,
    int? limit,
    int? offset,
  }) async {
    var db = await SQFLiteUtils.getDatabase();
    var rows = await db.query(
      table,
      distinct: distinct,
      columns: columns,
      where: where,
      whereArgs: whereArgs,
      groupBy: groupBy,
      having: having,
      orderBy: orderBy,
      limit: limit,
      offset: offset,
    );
    var items = rows.map<T>((row) => fromMap(row)).toList();
    return items;
  }
}
