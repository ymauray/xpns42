import 'package:path/path.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqflite/sqflite.dart';

part 'database_provider.g.dart';

Future<String> _databasePath() async =>
    join(await getDatabasesPath(), 'xpns42.db');

Future<void> _create(Database db) async {
  await db.execute('''
    CREATE TABLE books (
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      title TEXT NOT NULL,
      initialBalance DOUBLE NOT NULL DEFAULT 0,
      currentBalance DOUBLE NOT NULL DEFAULT 0
    )
  ''');
}

Future<void> _upgradeTo(int version, Database db) async {}

@riverpod
Future<Database> database(DatabaseRef ref) async {
  final database = await openDatabase(
    await _databasePath(),
    version: 1,
    onCreate: (db, version) async {
      await _create(db);
      for (var i = 2; i <= version; i++) {
        await _upgradeTo(i, db);
      }
    },
    onUpgrade: (db, oldVersion, newVersion) async {
      for (var i = oldVersion + 1; i <= newVersion; i++) {
        await _upgradeTo(i, db);
      }
    },
    onDowngrade: (db, oldVersion, newVersion) async {
      throw UnsupportedError('Downgrading is not supported');
    },
  );

  return database;
}
