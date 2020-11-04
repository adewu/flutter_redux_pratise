import 'package:flutter_redux_pratise/data/db/dbconst.dart';
import 'package:flutter_redux_pratise/data/db/dbmanager.dart';
import 'package:flutter_redux_pratise/model/list_Item.dart';
import 'package:sqflite/sqflite.dart';

class ListItemDAO {
  void insert(ListItem item) async {
    final Database db = await DBManager.getDB();
    await db.insert(DBConst.TABLE_LIST_ITEM, item.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<ListItem>> queryAllItems() async {
    final Database db = await DBManager.getDB();

    final List<Map<String, dynamic>> maps = await db.query(DBConst.TABLE_LIST_ITEM);

    // Convert the List<Map<String, dynamic> into a List<ListItem>.
    return List.generate(maps.length, (i) {
      return ListItem(
        id: maps[i]['id'],
        content: maps[i]['content'],
      );
    });
  }



}
