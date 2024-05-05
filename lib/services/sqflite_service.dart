import 'package:mopa_app/models/db_models/voyager_db.dart';
import 'package:mopa_app/services/sqflite_store.dart';
import 'package:sqflite/sqflite.dart';

class SqfliteService {
  static final SqfliteStore _store = SqfliteStore.instance;

  static Future<VoyagerDB?> getLastUnfinishedVoyager() async {
    VoyagerDB? voyager;
    Database db = await _store.database;
    List<Map> results = await db.query("voyager", where: "is_ended = false");
    if (results.isNotEmpty) {
      voyager = VoyagerDB.fromMap(results[0]);
    }
    return voyager;
  }
}
