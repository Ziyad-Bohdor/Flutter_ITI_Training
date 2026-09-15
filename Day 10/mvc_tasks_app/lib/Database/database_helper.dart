import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../Model/task.dart';

class DatabaseHelper {
  static final DatabaseHelper instance =
      DatabaseHelper._internal();

  DatabaseHelper._internal();

  factory DatabaseHelper() {
    return instance;
  }

  Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDatabase();

    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();

    final path = join(
      databasePath,
      'tasks_database.db',
    );

    return await openDatabase(
      path,
      version: 1,
      onCreate: (database, version) async {
        await database.execute('''
          CREATE TABLE tasks (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            taskName TEXT NOT NULL,
            subject TEXT NOT NULL,
            deadline INTEGER NOT NULL,
            isCompleted INTEGER NOT NULL
          )
        ''');
      },
    );
  }

  Future<int> insertTask(Task task) async {
    final db = await database;

    return await db.insert(
      'tasks',
      task.toMap(),
    );
  }

  Future<List<Task>> getTasks() async {
    final db = await database;

    final result = await db.query(
      'tasks',
      orderBy: 'id DESC',
    );

    return result.map((map) {
      return Task.fromMap(map);
    }).toList();
  }

  Future<int> updateTask(Task task) async {
    final db = await database;

    return await db.update(
      'tasks',
      task.toMap(),
      where: 'id = ?',
      whereArgs: [task.id],
    );
  }

  Future<int> deleteTask(int id) async {
    final db = await database;

    return await db.delete(
      'tasks',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}