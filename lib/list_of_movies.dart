import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class  Movie extends StatefulWidget {

  const Movie({Key key}) : super(key: key);

  @override
  _MovieState createState() => _MovieState();
}

class _MovieState extends State<Movie> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text("Movie"),
          leading: Icon(Icons.arrow_back),
        ),
        body: ListView.builder(padding: const EdgeInsets.all(10), itemCount: 15,
            itemBuilder:(BuildContext context, int index){

      return ClipRRect(  borderRadius: BorderRadius.all(Radius.circular(25)),
          child: Container(
           margin: EdgeInsets.all(3),
        decoration: BoxDecoration(
          color: Colors.grey,

        ),height: 130,
      child: Row(mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/movie1.jpg',
            height: 100,
            width: 100,
          ),
          Column(
            children: [
              Container(
                alignment: Alignment.topLeft,
                padding: new EdgeInsets.fromLTRB(5, 0, 1, 0),
                child: Text(
                  "Movie",
                  style:
                  TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
              Row(
                children: [
                  Container(
                    padding: new EdgeInsets.fromLTRB(10, 0, 1, 0),
                    child: Icon(
                      Icons.star,
                      color: Colors.blue,
                      size: 15,
                    ),
                  ),
                  Container(
                    padding: new EdgeInsets.fromLTRB(0, 0, 1, 0),
                    child: Icon(
                      Icons.star,
                      color: Colors.blue,
                      size: 15,
                    ),
                  ),
                  Container(
                    padding: new EdgeInsets.fromLTRB(0, 0, 1, 0),
                    child: Icon(
                      Icons.star,
                      color: Colors.blue,
                      size: 15,
                    ),
                  ),
                  Container(
                    padding: new EdgeInsets.fromLTRB(0, 0, 1, 0),
                    child: Icon(
                      Icons.star,
                      color: Colors.blue,
                      size: 15,
                    ),
                  ),
                  Container(
                    padding: new EdgeInsets.fromLTRB(0, 0, 1, 0),
                    child: Icon(
                      Icons.star,
                      color: Colors.blue,
                      size: 15,
                    ),
                  ),
                  Container(
                    padding: new EdgeInsets.fromLTRB(0, 0, 1, 0),
                    child: Icon(
                      Icons.star,
                      size: 15,
                      color: Colors.blueGrey,
                    ),
                  ),
                  Container(
                    padding: new EdgeInsets.fromLTRB(3, 0, 3, 0),
                    child: Text(
                      "5M review",
                      style: TextStyle(
                          color: Colors.white, fontSize: 18),
                    ),
                  ),

                ],
              ),
              Row(
                children: [
                  Container(
                      alignment: Alignment.topLeft,
                      padding:
                      new EdgeInsets.fromLTRB(0, 10, 10, 0),
                      child: Icon(
                        Icons.alarm,
                        color: Colors.white,
                        size: 20,
                      )),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: new EdgeInsets.fromLTRB(0, 10, 10, 0),
                    child: Text(
                      "1h 25m",
                      style: TextStyle(
                          color: Colors.white, fontSize: 18),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                      padding:
                      new EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: Icon(
                        Icons.calendar_today,
                        color: Colors.white,
                        size: 20,
                      )),
                  Container(
                    padding: new EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: Text(
                      "2021/4/31",
                      style: TextStyle(
                          color: Colors.white, fontSize: 18),
                    ),
                  ),

                ],
              ),
              Container(
                padding: new EdgeInsets.fromLTRB(0, 5, 5, 0),
                height: 10,
                width: 50,
              )
            ],
          ),

        ],
      )));
    }));
  }
}
