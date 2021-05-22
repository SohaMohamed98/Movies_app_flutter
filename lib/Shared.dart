import 'package:dio/dio.dart';

import 'movie.dart';




  Future<List<Results>> getMoviesData(List<Results> movies, String endPoint) async {
    try {
      var response = await Dio().get(
          'https://api.themoviedb.org/3/movie/$endPoint',
          queryParameters: {'api_key': 'f55fbda0cb73b855629e676e54ab6d8e'});
      for (var item in response.data["results"]) {
        Results m = Results.fromJson(item);
        movies.add(m);

      }
      print(movies.length);
    } catch (e) {
      print(e);
    }
    return movies;
  }
