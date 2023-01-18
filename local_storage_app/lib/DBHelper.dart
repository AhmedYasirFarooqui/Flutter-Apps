// ignore_for_file: depend_on_referenced_packages, constant_identifier_names, file_names

import 'dart:async';
import 'dart:io' as io;
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'Photo.dart';

class DBHelper {
  static Database? _db;
  static const String ID = 'id';
  static const String NAME = 'photo_name';
  static const String TABLE = 'PhotosTable';
  static const String DB_NAME = 'photos.db';

  Future<Database?> get db async {
    if (null != _db) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, DB_NAME);
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute("CREATE TABLE $TABLE ($ID INTEGER, $NAME TEXT)");
  }

  Future<Photo> save(Photo employee) async {
    var dbClient = await db;
    employee.id = await dbClient!.insert(TABLE, employee.toMap());
    return employee;
  }

  Future<List<Photo>> getPhotos() async {
    try {
      var dbClient = await db;
      List<Map> maps = await dbClient!.query(
        TABLE,
        columns: [ID, NAME],
      );
      List<Photo> employees = [];
      if (maps.isNotEmpty) {
        for (int i = 0; i < maps.length; i++) {
          employees.add(Photo.fromMap(maps[i] as Map<String, dynamic>));
        }
      }
      return employees;
    } on PlatformException {
      rethrow;
    }
  }

  Future close() async {
    var dbClient = await db;
    dbClient!.close();
  }
}
