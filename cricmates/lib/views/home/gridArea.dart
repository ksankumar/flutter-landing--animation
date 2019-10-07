import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

class GridArea extends StatefulWidget {
  @override
  _GridAreaState createState() => _GridAreaState();
}

class _GridAreaState extends State<GridArea> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 0),
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: ResponsiveGridRow(
              children: [
                ResponsiveGridCol(
                  xs: 6,
                  md: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      alignment: Alignment(0, 0),
                      child: Column(
                        children: <Widget>[
                          Icon(
                            Icons.calendar_today,
                            size: 50,
                            color: Colors.deepPurple[900],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Matches",
                            style: TextStyle(
                                color: Colors.deepPurple[900], fontSize: 15),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                ResponsiveGridCol(
                  xs: 6,
                  md: 3,
                  child: Semantics(
                    child: Container(
                      alignment: Alignment(0, 0),
                      child: Column(
                        children: <Widget>[
                          Icon(
                            Icons.supervised_user_circle,
                            size: 50,
                            color: Colors.deepPurple[900],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Players",
                            style: TextStyle(
                                color: Colors.deepPurple[900], fontSize: 15),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                ResponsiveGridCol(
                  xs: 6,
                  md: 3,
                  child: Container(
                    alignment: Alignment(0, 0),
                    child: Column(
                      children: <Widget>[
                        Icon(
                          Icons.mobile_screen_share,
                          size: 50,
                          color: Colors.deepPurple[900],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Anouncements",
                          style: TextStyle(
                              color: Colors.deepPurple[900], fontSize: 15),
                        )
                      ],
                    ),
                  ),
                ),
                ResponsiveGridCol(
                  xs: 6,
                  md: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      alignment: Alignment(0, 0),
                      child: Column(
                        children: <Widget>[
                          Icon(
                            Icons.image_aspect_ratio,
                            size: 50,
                            color: Colors.deepPurple[900],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Gallery",
                            style: TextStyle(
                                color: Colors.deepPurple[900], fontSize: 15),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                ResponsiveGridCol(
                  xs: 6,
                  md: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      alignment: Alignment(0, 0),
                      child: Column(
                        children: <Widget>[
                          Icon(
                            Icons.map,
                            size: 50,
                            color: Colors.deepPurple[900],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Grounds",
                            style: TextStyle(
                                color: Colors.deepPurple[900], fontSize: 15),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                ResponsiveGridCol(
                  xs: 6,
                  md: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      alignment: Alignment(0, 0),
                      child: Column(
                        children: <Widget>[
                          Icon(
                            Icons.thumbs_up_down,
                            size: 50,
                            color: Colors.deepPurple[900],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Availabilities",
                            style: TextStyle(
                                color: Colors.deepPurple[900], fontSize: 15),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
