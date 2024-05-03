import 'package:flutter/widgets.dart';
import 'package:mopa_app/models/ship_models/ship_900.dart';
import 'package:mopa_app/models/voyager.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqfliteService {
  static final _databaseName = "Voyager.db";
  static final _databaseVersion = 1;

  SqfliteService._privateConstructor();

  static final SqfliteService instance = SqfliteService._privateConstructor();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = _initDatabase();
    return _database!;
  }

  _initDatabase() async {
    WidgetsFlutterBinding.ensureInitialized();
    String pathToDB = join(await getDatabasesPath(), _databaseName);
    print(pathToDB);
    return await openDatabase(pathToDB,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int verson) async {
    // SQL statement to create voyager
    await db.execute('''
      CREATE TABLE voyager (
        id INTEGER PRIMARY KEY,
        people_count INTEGER,
        ship TEXT,
        is_ended BOOLEAN
      )''');

    // Create Before readings table
    await db.execute('''
      CREATE TABLE before_readings (
        id INTEGER PRIMARY KEY,
        voyager_id INTEGER NOT NULL,    
        tank_type TEXT NOT NULL,
        tank_position TEXT NOT NULL,
        value numeric NOT NULL,     
        FOREIGN KEY (voyager_id) REFERENCES voyager (id) ON DELETE CASCADE
      )''');

    // Create After readings table
    await db.execute('''
      CREATE TABLE after_readings (
        id INTEGER PRIMARY KEY,
        voyager_id INTEGER NOT NULL,    
        tank_type TEXT NOT NULL,
        tank_position TEXT NOT NULL,
        value numeric NOT NULL,     
        FOREIGN KEY (voyager_id) REFERENCES voyager (id) ON DELETE CASCADE
      )''');
  }

// fetch a single blog
  Future<Voyager> fetchBlog(int id) async {
    Database db = await instance.database;
    List<Map> results =
        await db.query("voyager");

    Voyager voyager = Voyager(peopleCount: 1, ship: Ship900());
    return voyager;
  }
}
