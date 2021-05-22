import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Shared.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../movie.dart';

class Top_rate extends StatefulWidget {
  const Top_rate({Key key}) : super(key: key);

  @override
  _Top_rateState createState() => _Top_rateState();
}

class _Top_rateState extends State<Top_rate> {
  List<Results> movies = [];

  @override
  Widget build(BuildContext context) {
    return  Container(
      color: Colors.amber[100],
      child: FutureBuilder(
        future: getMoviesData(movies,'top_rated'),
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
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    child: Container(
                      margin: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        color: Colors.brown[600],
                      ),
                      height: 130,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Hero(tag: movies[index].id, child:
                          Image.network(movies[index].posterPath,
                            height: 100,
                            width: 90,
                          )),
                          Column(
                            children: [
                              Container(
                                alignment: Alignment.topLeft,
                                padding: new EdgeInsets.fromLTRB(5, 0, 1, 0),
                                child: Text(
                                  movies[index].title,
                                  style: TextStyle(
                                      color: Colors.deepOrange, fontSize: 16),
                                  softWrap: true,
                                  textDirection: TextDirection.ltr,
                                ),
                                width: 230,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    padding:
                                    new EdgeInsets.fromLTRB(0, 0, 1, 0),
                                    child: RatingBar.builder(
                                      initialRating: movies[index]
                                          .voteAverage
                                          .toDouble(),
                                      minRating: 1,
                                      itemSize: 12,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 8,
                                      itemPadding: EdgeInsets.symmetric(
                                          horizontal: 0.0),
                                      itemBuilder: (context, _) => Icon(
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
                                    new EdgeInsets.fromLTRB(3, 0, 3, 0),
                                    child: Text(
                                      movies[index].voteAverage.toString(),
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                  ),
                                ],
                                mainAxisSize: MainAxisSize.min,
                                textDirection: TextDirection.ltr,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                      alignment: Alignment.topLeft,
                                      padding: new EdgeInsets.fromLTRB(
                                          0, 0, 10, 0),
                                      margin:
                                      new EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      child: Icon(
                                        Icons.favorite_outlined,
                                        color: Colors.red,
                                        size: 20,
                                      )),
                                  Container(
                                    alignment: Alignment.topLeft,
                                    padding:
                                    new EdgeInsets.fromLTRB(0, 0, 10, 0),
                                    child: Text(
                                      movies[index].popularity.toString(),
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                      padding:
                                      new EdgeInsets.fromLTRB(0, 3, 0, 0),
                                      child: Icon(
                                        Icons.calendar_today,
                                        color: Colors.white,
                                        size: 20,
                                      )),
                                  Container(
                                    padding:
                                    new EdgeInsets.fromLTRB(10, 10, 0, 0),
                                    child: Text(
                                      movies[index].releaseDate,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}
