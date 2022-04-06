import '../data/model/entity.dart';

abstract class BaseRepository<T extends Entity> {
  Future<void> create(T t);

  Future<T> read(int id);

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
  });

  Future<T> update(T t);

  Future<void> delete(int id);
}
