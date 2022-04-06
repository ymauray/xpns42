import 'package:sqflite/sqflite.dart';

import '../constants.dart';

abstract class SQFLiteUtils {
  SQFLiteUtils._();

  static Future<Database> getDatabase() async {
    var _db = await openDatabase(
      Constants.databasePath,
      version: Constants.databaseVersion,
      onUpgrade: (db, from, to) {
        for (var version = 1; version <= to; version++) {
          if (version == 1) {
            db.execute('''
              CREATE TABLE books (
                id INTEGER PRIMARY KEY,
                title TEXT NOT NULL,
                person1 TEXT NOT NULL,
                person2 TEXT NOT NULL,
                sortOrder INTEGER NOT NULL DEFAULT 99999,
                createdAt TEXT NOT NULL,
                updatedAt TEXT NOT NULL
              )
            ''');
          }
        }
      },
    );

    return _db;
  }
}
