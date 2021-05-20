import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/movie.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'movie.dart';

class Movie extends StatefulWidget {
  const Movie({Key key}) : super(key: key);

  @override
  _MovieState createState() => _MovieState();
}

class _MovieState extends State<Movie> {
  List<Results> movies = [];

  Future<List<Results>> getMovies() async {
    try {
      var response = await Dio().get(
          'https://api.themoviedb.org/3/movie/now_playing',
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text("Now Playing"),
          leading: Icon(Icons.arrow_back),
        ),
        body: Container(
            color: Colors.amber[100],
            child: FutureBuilder(
              future: getMovies(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting &&
                    !snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.error != null) {
                  return Center(
                    child: Text("ERROR"),
                  );
                }
                return ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, "/first",
                                arguments: movies[index]);
                          },
                          child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25)),
                              child: Container(
                                  margin: EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                    color: Colors.brown[600],
                                  ),
                                  height: 130,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image.network(
                                        "https://image.tmdb.org/t/p/w200" +
                                            movies[index].posterPath,
                                        height: 100,
                                        width: 90,
                                      ),
                                      Column(
                                        children: [
                                          Container(
                                            alignment: Alignment.topLeft,
                                            padding: new EdgeInsets.fromLTRB(
                                                5, 0, 1, 0),
                                            child: Text(
                                              movies[index].title,
                                              style: TextStyle(
                                                  color: Colors.deepOrange,
                                                  fontSize: 16),
                                              softWrap: true,
                                              textDirection: TextDirection.ltr,
                                              //overflow: TextOverflow.fade,
                                            ),
                                            width: 230,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                padding:
                                                    new EdgeInsets.fromLTRB(
                                                        0, 0, 1, 0),
                                                child: RatingBar.builder(
                                                  initialRating: movies[index]
                                                      .voteAverage
                                                      .toDouble(),
                                                  minRating: 1,
                                                  itemSize: 12,
                                                  direction: Axis.horizontal,
                                                  allowHalfRating: true,
                                                  itemCount: 8,
                                                  itemPadding:
                                                      EdgeInsets.symmetric(
                                                          horizontal: 0.0),
                                                  itemBuilder: (context, _) =>
                                                      Icon(
                                                    Icons.ac_unit,
                                                    color: Colors.amber,
                                                  ),
                                                  onRatingUpdate: (rating) {
                                                    print(rating);
                                                  },
                                                ),
                                              ),
                                              Container(
                                                padding:
                                                    new EdgeInsets.fromLTRB(
                                                        3, 0, 3, 0),
                                                child: Text(
                                                  movies[index]
                                                      .voteAverage
                                                      .toString(),
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18),
                                                ),
                                              ),
                                            ],
                                            mainAxisSize: MainAxisSize.min,
                                            textDirection: TextDirection.ltr,
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                  alignment: Alignment.topLeft,
                                                  padding:
                                                      new EdgeInsets.fromLTRB(
                                                          0, 0, 10, 0),
                                                  margin:
                                                      new EdgeInsets.fromLTRB(
                                                          0, 0, 0, 0),
                                                  child: Icon(
                                                    Icons.favorite_outlined,
                                                    color: Colors.red,
                                                    size: 20,
                                                  )),
                                              Container(
                                                alignment: Alignment.topLeft,
                                                padding:
                                                    new EdgeInsets.fromLTRB(
                                                        0, 0, 10, 0),
                                                child: Text(
                                                  movies[index]
                                                      .popularity
                                                      .toString(),
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                  padding:
                                                      new EdgeInsets.fromLTRB(
                                                          0, 3, 0, 0),
                                                  child: Icon(
                                                    Icons.calendar_today,
                                                    color: Colors.white,
                                                    size: 20,
                                                  )),
                                              Container(
                                                padding:
                                                    new EdgeInsets.fromLTRB(
                                                        10, 10, 0, 0),
                                                child: Text(
                                                  movies[index].releaseDate,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ))));
                    });
              },
            )));
  }
}
