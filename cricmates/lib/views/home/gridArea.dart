import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';
class GridArea extends StatefulWidget {
  @override
  _GridAreaState createState() => _GridAreaState();
}

class _GridAreaState extends State<GridArea> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: Container(
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
                        Icon(Icons.calendar_today, size: 50, color: Colors.deepPurple[900],),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Matches", style: TextStyle(color: Colors.black, fontSize: 20),)
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
                      Icon(Icons.supervised_user_circle, size: 50, color: Colors.deepPurple[900],),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Players", style: TextStyle(color: Colors.black, fontSize: 20),)
                    ],
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
                      Icon(Icons.announcement, size: 50, color: Colors.deepPurple[900],),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Anouncements", style: TextStyle(color: Colors.black, fontSize: 20),)
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
                        Icon(Icons.image, size: 50, color: Colors.deepPurple[900],),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Gallery", style: TextStyle(color: Colors.black, fontSize: 20),)
                      ],
                    ),
                  ),
                ),
              ),
               ResponsiveGridCol(
                xs: 6,
                md: 3,
                child:Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    alignment: Alignment(0, 0),
                    child: Column(
                      children: <Widget>[
                        Icon(Icons.map, size: 50, color: Colors.deepPurple[900],),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Grounds", style: TextStyle(color: Colors.black, fontSize: 20),)
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
                        Icon(Icons.thumb_up, size: 50, color: Colors.deepPurple[900],),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Availabilities", style: TextStyle(color: Colors.black, fontSize: 20),)
                      ],
                    ),
                  ),
                ),
              ),
         ],
       ),
      ),
    );
  }
}