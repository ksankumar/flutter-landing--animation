import 'package:cricmates/app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    return Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/img/app-logo.png"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget coverImageArea() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/img/background.png"),
          fit: BoxFit.cover,
        ),
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
                  size: 30,
                  color: Colors.white,
                )),
          ),
          Positioned(
            bottom: 50,
            right: 0,
            child: Padding(
                padding: EdgeInsets.all(15.0),
                child: FloatingActionButton.extended(
                  icon: Icon(
                  Icons.mode_edit,
                  size: 20,
                  color: Colors.white,
                ),
                label: Text("Edit"),
                onPressed: (){},
                ),
                ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Icon(
                  Icons.notifications_active,
                  size: 30,
                  color: Colors.white,
                )),
          ),
         Center(
           child: logoArea(),
         ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
                color: Colors.black38,
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width / 1.5,
                        child: Center(
                          child: Center(
                            child: Text(
                              "Colombus Super Kings",
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        child: Center(
                          child: Center(
                            child: Text(
                              "26 Players",
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )),
          )
        ],
      ),
    );
  }
}
