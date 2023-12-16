import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper.internal();
  factory DBHelper() => _instance;

  static Database? _db;

  DBHelper.internal();

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await initDb();
    return _db!;
  }

  Future<Database> initDb() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'user.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  void _onCreate(Database db, int version) async {
    // Create tables and perform any necessary setup
    await db.execute(
        'CREATE TABLE user (id INTEGER PRIMARY KEY, username TEXT, phone TEXT, address TEXT, email TEXT)');
  }

  Future<void> insertUser(Map<String, dynamic> user) async {
    Database database = await db;
    await database.insert('user', user);
  }

  Future<Map<String, dynamic>?> getUser() async {
    Database database = await db;
    List<Map<String, dynamic>> result = await database.query('user');
    return result.isNotEmpty ? result.first : null;
  }
}
