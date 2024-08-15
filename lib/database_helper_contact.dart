import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;

    _database = await _initDatabase();
    return _database;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'contact_info.db');

    return openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE contact_info (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        whatsapp TEXT NOT NULL,
        linkedin TEXT NOT NULL,
        github TEXT,
        instagram TEXT,
        profile_summary TEXT NOT NULL
      )
    ''');
  }

  Future<int> insertContactInfo(Map<String, dynamic> contactInfo) async {
    Database? db = await database;
    return await db!.insert('contact_info', contactInfo);
  }
}
