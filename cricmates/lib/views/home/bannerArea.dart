import 'package:flutter/material.dart';

class BannerArea extends StatefulWidget {
  @override
  _BannerAreaState createState() => _BannerAreaState();
}

class _BannerAreaState extends State<BannerArea> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Row(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width / 3,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/img/img_biking.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 2,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      "Anouncement",
                      style: TextStyle(color: Colors.black, fontSize: 30),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      "This component is just for Anouncement",
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
