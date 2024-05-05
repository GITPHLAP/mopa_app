import 'package:flutter/widgets.dart';
import 'package:mopa_app/models/ship_models/ship_900.dart';
import 'package:mopa_app/models/voyager.dart';
import 'package:mopa_app/services/sqflite_store.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqfliteService {
  static final SqfliteStore _store = SqfliteStore.instance;

// fetch a single blog
  static Future<Voyager> fetchBlog(int id) async {
    Database db = await _store.database;
    List<Map> results =
        await db.query("voyager");

    Voyager voyager = Voyager(peopleCount: 1, ship: Ship900());
    return voyager;
  }
}
