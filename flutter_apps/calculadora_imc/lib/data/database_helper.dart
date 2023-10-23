import 'package:calculadora_imc/model/measurement.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static Database? _database;
  static const String tableName = 'measurements';

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    final path = join(await getDatabasesPath(), 'measurements.db');

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute('''
          CREATE TABLE $tableName(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            date TEXT,
            weight REAL,
            height REAL,
            imc REAL,
            classification TEXT
          )
        ''');
      },
    );
  }

  Future<int> insertMeasurement(Measurement measurement) async {
    final db = await database;
    return await db.insert(tableName, measurement.toMap());
  }

  Future<List<Measurement>> getMeasurements() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(tableName);

    return List.generate(maps.length, (i) {
      return Measurement.fromMap(maps[i]);
    });
  }
}
