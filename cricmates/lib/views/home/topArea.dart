import 'package:cricmates/app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class TopArea extends StatefulWidget {
  @override
  _TopAreaState createState() => _TopAreaState();
}

class _TopAreaState extends State<TopArea> {
  Color splashColor = Colors.deepPurple[900];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          Flexible(
            flex: 10,
            child: coverImageArea(),
          )
        ],
      ),
    );
  }

  Widget logoArea() {
    return Hero(
      tag: "logoImage",
      child: Container(
        height: 150,
        width: 150,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/img/tiger-logo.png"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget coverImageArea() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomRight,
            colors: [
              Colors.deepPurple,
              Colors.deepPurple[800],
              Colors.deepPurple[900],
            ]),
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Icon(
                  Icons.menu,
                  size: 25,
                  color: Colors.white,
                )),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Icon(
                  Icons.notifications_none,
                  size: 25,
                  color: Colors.white,
                )),
          ),
          Positioned(
            top: 0,
            right: 50,
            child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Icon(
                  Icons.info_outline,
                  size: 25,
                  color: Colors.white,
                )),
          ),
          Positioned(
            top: 0,
            right: 100,
            child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Icon(
                  Icons.search,
                  size: 25,
                  color: Colors.white,
                )),
          ),
          Positioned(
            left: 10,
            top: 70,
            child: Center(child: logoArea()),
          ),
          Positioned(
              top: 100,
              left: 160,
              right: 10,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 5,
                  ),
                  AutoSizeText(
                    'Columbus Super Kings',
                    style: TextStyle(fontSize: 25, color: Colors.white),
                    maxLines: 1,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  AutoSizeText(
                    '26 players',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                    maxLines: 1,
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
