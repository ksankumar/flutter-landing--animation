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
        body: Column(
          children: <Widget>[
            Flexible(
              flex: 2,
              child: TopArea(),
            ),
            Flexible(
              flex: 1,
              child: BannerArea(),
            ),
            Flexible(
              flex: 3,
              child: GridArea(),
            )
          ],
        ),
      ),
    );
  }
}
