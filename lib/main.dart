import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Popular/popular_movies.dart';
import 'package:flutter_app/favourite/favouriteModel.dart';
import 'package:flutter_app/favourite/favourite_view.dart';
import 'package:flutter_app/movie.dart';
import 'package:flutter_app/now_playing/list_of_movies.dart';
import 'package:flutter_app/top_rate/Top_rate.dart';
import 'package:flutter_app/upcoming_movies/Upcoming.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';

import 'database/database.dart';
import 'now_playing/details_movie.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  AppDatabase database = AppDatabase();
  await database.createDB();
  runApp(MyApp());


}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      ChangeNotifierProvider(create: (_)=> MoviesModel(),
        child: MaterialApp(
        title: 'Movies ',
        theme: ThemeData(
          primarySwatch: Colors.amber,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: DefaultTabController(
          length: 5,
          child: Scaffold(
            appBar: AppBar(
              bottom: TabBar(
                tabs: [
                  Tab(text: "now_playing",),
                  Tab(text: "Popular",),
                  Tab(text: "Upcomming",),
                  Tab(text: "Top_rate"),
                  Tab(text: "Favourite",)
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
                Favourites()
              ],
            ),
          ),
        ),
         routes: {
           '/first': (context) => MyHomePage(),
           "/list": (context) => Movie()
         },
        debugShowCheckedModeBanner: false,
    ),
      );
  }
}


