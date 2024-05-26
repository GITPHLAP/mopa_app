import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqfliteStore {
  static final _databaseName = "Voyager.db";
  static final _databaseVersion = 1;

  SqfliteStore._privateConstructor();

  static final SqfliteStore instance = SqfliteStore._privateConstructor();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
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
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        people_count INTEGER,
        ship_type TEXT,
        is_ended BOOLEAN
      )''');

    // Create Before readings table
    await db.execute('''
      CREATE TABLE before_readings (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        voyager_id INTEGER NOT NULL,    
        tank_type TEXT NOT NULL,
        tank_position TEXT NOT NULL,
        value numeric NOT NULL,     
        FOREIGN KEY (voyager_id) REFERENCES voyager (id) ON DELETE CASCADE
      )''');

    // Create After readings table
    await db.execute('''
      CREATE TABLE after_readings (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        voyager_id INTEGER NOT NULL,    
        tank_type TEXT NOT NULL,
        tank_position TEXT NOT NULL,
        value numeric NOT NULL,     
        FOREIGN KEY (voyager_id) REFERENCES voyager (id) ON DELETE CASCADE
      )''');
  }
}
