import 'dart:async';
import 'model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

  //add result a sqlite data base
  Future<void> insertData(Data data) async {

    final database = openDatabase(

      join(await getDatabasesPath(), 'bmidb.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE bmis(id INTEGER PRIMARY KEY, genre TEXT, bmi REALE)',
        );
      },
      version: 1,
    );
   
    final db = await database;

    await db.insert(
      'bmis',
      data.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

