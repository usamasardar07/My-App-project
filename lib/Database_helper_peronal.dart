import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelperPersonal {
  static final DatabaseHelperPersonal _instance = DatabaseHelperPersonal._internal();
  factory DatabaseHelperPersonal() => _instance;
  DatabaseHelperPersonal._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), 'user_data.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE users(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, email TEXT UNIQUE, password TEXT, city TEXT, cnic TEXT, userType TEXT)",
        );
      },
      version: 1,
    );
  }

  Future<void> insertUser(Map<String, dynamic> user) async {
    final db = await database;
    await db.insert(
      'users',
      user,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<Map<String, dynamic>?> getUser(String email, String password) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'users',
      where: "email = ? AND password = ?",
      whereArgs: [email, password],
    );
    if (maps.isNotEmpty) {
      return maps.first;
    }
    return null;
  }

  Future<void> updateUser(Map<String, dynamic> user) async {
    final db = await database;
    await db.update(
      'users',
      user,
      where: "email = ?",
      whereArgs: [user['email']],
    );
  }

  Future<void> deleteUser(String email) async {
    final db = await database;
    await db.delete(
      'users',
      where: "email = ?",
      whereArgs: [email],
    );
  }
}
