import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../movie.dart';

class AppDatabase {
  static final instance = AppDatabase._internal();
  Database database;

  factory AppDatabase() {
    return instance;
  }

  AppDatabase._internal() {}

  createDB() async {
    database = await openDatabase(
      join(await getDatabasesPath(), 'movies.db'),
      onCreate: (db, version) {
        db.execute('CREATE TABLE movies(id INTEGER PRIMARY KEY,title TEXT,imageURL TEXT,vote INTEGER,popularity REAL,release TEXT,overView TEXT)');

      },
      version: 2,
    );
  }

  insertMovie(Results movie) async {
    return await database.insert("movies", movie.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Results>> getMovies() async {
    List<Map<String,dynamic>> maps = await database.query("movies");
    return List.generate(maps.length, (index){
      return Results.fromJson(maps[index]);
    });
  }
}
