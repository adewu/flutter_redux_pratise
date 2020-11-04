import 'package:flutter_redux_pratise/data/db/dbconst.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBManager {
  static Database _database;

  static Future<Database> getDB() async {
    if (_database == null) {
      _database = await openDatabase(
        join(await getDatabasesPath(), DBConst.DB_NAME),
        onCreate: (db, version) {
          return db.execute(
            "CREATE TABLE "+DBConst.TABLE_LIST_ITEM +"(id INTEGER PRIMARY KEY, content TEXT)",
          );
        },
        version: 1,
      );
    }
    return _database;
  }

  Future<Database> closeDB() async {
    if (_database != null) {
      await _database.close();
    }
  }
}
