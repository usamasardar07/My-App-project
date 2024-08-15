import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'user_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute(
        '''
      CREATE TABLE users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        email TEXT NOT NULL,
        password TEXT NOT NULL,
        userType TEXT NOT NULL
      )
      '''
    );
  }

  // Insert a new user into the database
  Future<void> insertUser(String email, String password, String userType) async {
    final db = await database;
    await db.insert(
      'users',
      {
        'email': email,
        'password': password,
        'userType': userType,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Get a user from the database based on email and password
  Future<Map<String, dynamic>?> getUser(String email, String password) async {
    final db = await database;
    List<Map<String, dynamic>> results = await db.query(
      'users',
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );

    if (results.isNotEmpty) {
      return results.first;
    } else {
      return null;
    }
  }

  // Update a user's information
  Future<void> updateUser(int id, String email, String password, String userType) async {
    final db = await database;
    await db.update(
      'users',
      {
        'email': email,
        'password': password,
        'userType': userType,
      },
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // Delete a user from the database
  Future<void> deleteUser(int id) async {
    final db = await database;
    await db.delete(
      'users',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
