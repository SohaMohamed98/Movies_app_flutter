import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

import 'favouriteModel.dart';

class Favourites extends StatefulWidget {
  Favourites({Key key}) : super(key: key);
  @override
  _Favourites createState() => _Favourites();
}

class _Favourites extends State<Favourites> {

  @override
  void initState() {
    Provider.of<MoviesModel>(context,listen: false).getDBMovies();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<MoviesModel>(builder: (context,model,child) {
      return ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: model.dbMovies.length,
          itemBuilder: (BuildContext context, int index) {
            return ClipRRect(
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
                      Hero(tag: model.dbMovies[index].id, child:
                      Image.network(model.dbMovies[index].posterPath,
                        height: 100,
                        width: 90,
                      )),
                      Column(
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            padding: new EdgeInsets.fromLTRB(5, 0, 1, 0),
                            child: Text(
                              model.dbMovies[index].title,
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
                                  initialRating:4
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
                                  model.dbMovies[index].voteCount.toString(),
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
                                  model.dbMovies[index].popularity.toString(),
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
              );
          });
    }
    );

  }
}
