import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Popular/popular_movies.dart';
import 'package:flutter_app/now_playing/list_of_movies.dart';
import 'package:flutter_app/top_rate/Top_rate.dart';
import 'package:flutter_app/upcoming_movies/Upcoming.dart';

import 'now_playing/details_movie.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies ',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(text: "now_playing",),
                Tab(text: "Popular",),
                Tab(text: "Upcomming",),
                Tab(text: "Top_rate",)
              ],
            ),title: Text('Movies'),
            backgroundColor: Colors.brown,
          ),
          body: TabBarView(
            children: [
              Movie(),
             Popular(),
              Upcoming(),
              Top_rate(),
            ],
          ),
        ),
      ),
       routes: {
         '/first': (context) => MyHomePage(),
         "/list": (context) => Movie()
       },
      debugShowCheckedModeBanner: false,
    );
  }
}


