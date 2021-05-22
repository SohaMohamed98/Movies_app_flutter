import 'package:flutter/foundation.dart';
import 'package:flutter_app/database/database.dart';
import 'package:flutter_app/movie.dart';

class MoviesModel extends ChangeNotifier {
  List<Results> _movies = List();
  AppDatabase _database = AppDatabase();
  List<Results> _dbMovies = List();
  List<Results> get movies => _movies;

  addMovie(Results movie) {
    _movies.add(movie);
    notifyListeners();
  }
  List<Results> get dbMovies => _dbMovies;
  MoviesModel() {
    print("movieModel");
    _database.getMovies().then((movies) {
      print(movies);
      _movies = movies;
      notifyListeners();
    });
  }

  getDBMovies(){
    _database.getMovies().then((movies) => _dbMovies = movies);
    notifyListeners();
  }
}