import 'package:mopa_app/models/db_models/reading_db.dart';
import 'package:mopa_app/models/db_models/voyager_db.dart';
import 'package:mopa_app/services/sqflite_store.dart';
import 'package:sqflite/sqflite.dart';

class SqfliteService {
  static final SqfliteStore _store = SqfliteStore.instance;

  static Future<VoyagerDB?> getLastUnfinishedVoyager() async {
    VoyagerDB? voyager;
    Database db = await _store.database;
    List<Map<String, Object?>> results = await db.query("voyager", where: "is_ended = false");
    if (results.isNotEmpty) {
      voyager = VoyagerDB.fromMap(results[0]);
    }
    return voyager;
  }

  static Future<int> upsertVoyager(VoyagerDB voyager) async {
    Database db = await _store.database;
    return await db.insert("voyager", voyager.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<List<ReadingDB>> getReadingsForVoyager(int voyagerId, bool isAfterReading) async {
    Database db = await _store.database;

    List<Map<String, Object?>> results;
    if (isAfterReading) {
      results = await db.query("before_readings",
          where: "voyager_id = ?", whereArgs: [voyagerId]);
    } else {
      results = await db.query("after_readings",
          where: "voyager_id = ?", whereArgs: [voyagerId]);
    }
    if (results.isNotEmpty) {
      return [
        for (final {
              'id': id as int,
              'tank_type':tankType as String,
              'tank_position': tankPosition as String,
              'value': value as double,
            } in results)
          ReadingDB(id, tankPosition, tankType, value),
      ];
    }
    return [];
  }

}
