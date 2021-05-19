import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_app/list_of_movies.dart';

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


        primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,

      ),
      home: Movie(),
      //home: MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(

        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Movie"),
        leading: Icon(Icons.arrow_back),
      ),
      body: Stack(
      children: <Widget>[
      Container(
      padding: EdgeInsets.only(top: 100 * 0.8),
      height: 500,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/movie1.jpg',
          ),
          fit: BoxFit.fill,
        ),
      ),
    ),Align(

            alignment: Alignment.bottomCenter,
            child: ClipRRect(

                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30), topLeft: Radius.circular(30)),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey,

                  ),height: 280,
                  child:Column(
                    children: <Widget>[ Row(
                      children: [
                        Container(alignment: Alignment.topLeft,
                          padding: new EdgeInsets.fromLTRB(10, 20, 0, 30),
                          child: Text("Movie 1",
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 20,
                                  color: Colors.white) ),),
                        Row(children: [Container(
                          padding: new EdgeInsets.fromLTRB(0, 60, 0, 0),
                          child: Icon(
                            Icons.star,
                            color: Colors.blue,
                          ),
                        ),
                        Container(
                          padding: new EdgeInsets.fromLTRB(3, 60, 3, 0),
                          child: Icon(
                            Icons.star,
                            color: Colors.blue,
                          ),
                        ),
                        Container(
                          padding: new EdgeInsets.fromLTRB(3, 60, 3, 0),
                          child: Icon(
                            Icons.star,
                            color: Colors.blue,
                          ),
                        ),
                        Container(
                          padding: new EdgeInsets.fromLTRB(3, 60, 3, 0),
                          child: Icon(
                            Icons.star,
                            color: Colors.blue,
                          ),
                        ),
                        Container(
                          padding: new EdgeInsets.fromLTRB(3, 60, 3, 0),
                          child: Icon(
                            Icons.star,
                            color: Colors.blue,
                          ),
                        ),
                        Container(
                          padding: new EdgeInsets.fromLTRB(3, 60, 3, 0),
                          child: Icon(
                            Icons.star,
                            color: Colors.blueGrey,
                          ),
                        ),
                        Container(
                          padding: new EdgeInsets.fromLTRB(3, 60, 3, 0),
                          child: Text( "5M review",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18
                            ),
                          ),
                        ),
                                ])],
                    ),
                    Row(
                      children: [
                        Container(
                            padding: new EdgeInsets.fromLTRB(20,10, 20,10),
                            child: Icon(
                              Icons.alarm,
                              color: Colors.white,
                              size: 20,
                            )
                        ),
                        Container(
                          padding: new EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: Text( "1h 25m",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                            padding: new EdgeInsets.fromLTRB(20, 0, 30, 0),
                            child: Icon(
                              Icons.calendar_today,
                              color: Colors.white,
                              size: 20,
                            )
                        ),
                        Container(
                          padding: new EdgeInsets.fromLTRB(5, 0, 5, 0),
                          child: Text( "2021/4/31",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(alignment: Alignment.topLeft,
                          padding: new EdgeInsets.fromLTRB(10, 5, 10, 0),
                          child: Text("Description: ",
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 20,
                                  color: Colors.white) ),),
                        Container(alignment: Alignment.topLeft,
                          padding: new EdgeInsets.fromLTRB(10, 2, 10, 0),
                          child: Text("""Although the performances from lead actresses Emily Watson and Denise Gough are strong, the circumstances that swirl around them are so predictable that they threaten to overwhelm the impact of that central duo.""",
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 14,
                                  color: Colors.white) ),)
                      ],
                    )]
                ))))]
       // This trailing comma makes auto-formatting nicer for build methods.
    ));
  }
}
