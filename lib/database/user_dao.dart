import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:uniride/entity/user.dart';

class UserDAO {
  static final UserDAO instance = UserDAO._init();
  static Database? _database;

  UserDAO._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase('users.db');
    return _database!;
  }

  Future<Database> _initDatabase(String filepath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filepath);

    return await openDatabase(path, version: 1, onCreate: _onCreateDatabase);
  }

  Future<void> _onCreateDatabase(Database db, int version) async {
    const idType = 'integer primary key autoincrement';
    const textType = 'text not null';

    await db.execute('''
    create table USER
    (
      ${UserFields.id} $idType,
      ${UserFields.name} $textType,
      ${UserFields.email} $textType,
      ${UserFields.password} $textType
    )
    ''');
  }

  Future<User> createUser(User user) async {
    final db = await instance.database;
    final id = await db.insert('USER', user.toJson());
    return user.clone(id: id);
  }

  Future<User> readUserById(int id) async {
    final db = await instance.database;
    final result = await db.query(
      'USER',
      columns: UserFields.all,
      where: '${UserFields.id} = ?',
      whereArgs: [id],
    );

    if (result.isNotEmpty) {
      return User.fromJson(result.first);
    } else {
      throw Exception('User ID $id Not Found');
    }
  }

  Future<User?> readUserByEmail(String email) async {
    final db = await instance.database;
    final result = await db.query(
      'USER',
      columns: UserFields.all,
      where: '${UserFields.email} = ?',
      whereArgs: [email],
    );

    if (result.isNotEmpty) {
      return User.fromJson(result.first);
    } else {
      // throw Exception('Email $email Not Found');
      return null;
    }
  }

  Future<List<User>> readAllUsers() async {
    final db = await instance.database;
    final results = await db.query('USER',
        columns: UserFields.all, orderBy: '${UserFields.id} asc');
    return results.map((result) => User.fromJson(result)).toList();
  }

  Future<void> updateUser(User user) async {
    final db = await instance.database;
    await db.update(
      'USER',
      user.toJson(),
      where: '${UserFields.id} = ?',
      whereArgs: [user.id],
    );
  }

  Future<void> deleteUserById(int id) async {
    final db = await instance.database;
    await db.delete(
      'USER',
      where: '${UserFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future<void> close() async {
    final db = await instance.database;
    db.close();
  }
}
