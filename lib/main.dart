import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_app/list_of_movies.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'movie.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies ',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/list',
      routes: {
        '/first': (context) => MyHomePage(
              result: Results(),
            ),
        "/list": (context) => Movie()
      },
      //home: Movie(),
      // home: MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.result}) : super(key: key);
  Results result;

  // final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _incrementCounter() {
    setState(() {});
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    widget.result = ModalRoute.of(context).settings.arguments;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.result.title),
          //   leading: Icon(Icons.arrow_back),
        ),
        body: Container(
            child: Stack(children: <Widget>[
          Container(
            alignment: Alignment.topCenter,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                    "https://image.tmdb.org/t/p/w200" +
                        widget.result.posterPath,
                  ),
                  fit: BoxFit.fill),
            ),
            height: 400,
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30)),
                  child: Container(
                      decoration: BoxDecoration(
                        color: Colors.brown[600],
                      ),
                      height: 350,
                      child: Column(children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              padding: new EdgeInsets.fromLTRB(10, 10, 0, 0),
                              child: Text(
                                widget.result.title,
                                style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    fontSize: 20,
                                    color: Colors.deepOrange),
                                softWrap: true,
                                textDirection: TextDirection.ltr,
                              ),
                              width: 240,
                            ),
                            Container(
                              padding: new EdgeInsets.fromLTRB(10, 10, 0, 0),
                              child: RatingBar.builder(
                                initialRating:
                                    widget.result.voteAverage.toDouble(),
                                minRating: 1,
                                itemSize: 20,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemPadding:
                                    EdgeInsets.symmetric(horizontal: 0.0),
                                itemBuilder: (context, _) => Icon(
                                  Icons.ac_unit,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              ),
                            )
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                padding: new EdgeInsets.fromLTRB(20, 10, 0, 10),
                                child: Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                  size: 20,
                                )),
                            Container(
                              padding: new EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Text(
                                widget.result.popularity.toString(),
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
                                padding: new EdgeInsets.fromLTRB(20, 0, 10, 0),
                                child: Icon(
                                  Icons.calendar_today,
                                  color: Colors.white,
                                  size: 20,
                                )),
                            Container(
                              padding: new EdgeInsets.fromLTRB(5, 0, 5, 0),
                              child: Text(
                                widget.result.releaseDate,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              padding: new EdgeInsets.fromLTRB(10, 5, 10, 10),
                              child: Text("OverView: ",
                                  style: TextStyle(
                                      fontStyle: FontStyle.italic,
                                      fontSize: 18,
                                      color: Colors.white)),
                            ),
                            Align(
                              child: Container(
                                  height: 120,
                                  padding: EdgeInsets.fromLTRB(8, 6, 8, 0),
                                  child: Text(widget.result.overview,
                                      softWrap: true,
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic,
                                          fontSize: 16,
                                          color: Colors.white))),
                              alignment: Alignment.topLeft,
                            )
                          ],
                        )
                      ]))))
        ]
                // This trailing comma makes auto-formatting nicer for build methods.
                )));
  }
}
