import 'package:cricmates/views/home/bannerArea.dart';
import 'package:cricmates/views/home/gridArea.dart';
import 'package:cricmates/views/home/topArea.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomRight,
                colors: [
                  Colors.deepPurple,
                  Colors.deepPurple[800],
                  Colors.deepPurple[900],
                  Colors.deepPurple[800],
                  Colors.deepPurple[900],
                  Colors.deepPurple[600],
                ]),
          ),
          child: Column(
            children: <Widget>[
              Flexible(
                flex: 3,
                child: TopArea(),
              ),
              Flexible(
                flex: 2,
                child: BannerArea(),
              ),
              Flexible(
                flex: 5,
                child: GridArea(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
