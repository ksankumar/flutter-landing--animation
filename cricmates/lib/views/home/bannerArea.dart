import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class BannerArea extends StatefulWidget {
  @override
  _BannerAreaState createState() => _BannerAreaState();
}

class _BannerAreaState extends State<BannerArea> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(20.0), topLeft: Radius.circular(20.0)),
      child: Container(
        color: Colors.white,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 15,
              left: 15,
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.timelapse,
                    color: Colors.deepPurple[900],
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Recents",
                    style:
                        TextStyle(fontSize: 18, color: Colors.deepPurple[900]),
                  )
                ],
              ),
            ),
            Positioned(
                top: 50,
                bottom: 5,
                left: 5,
                right: 5,
                child: CarouselSlider(
                  autoPlay: true,
                  items: [1, 2, 3, 4, 5].map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Card(
                          elevation: 2,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            // decoration: BoxDecoration(color: Colors.amber),
                            child: Stack(
                              children: <Widget>[
                                Positioned(
                                  top: 15,
                                  left: 15,
                                  child: Text(
                                    'Activity $i',
                                    style: TextStyle(fontSize: 16.0),
                                  ),
                                ),
                                Positioned(
                                  top: 40,
                                  left: 15,
                                  child: Text(
                                    'Subtitle $i',
                                    style: TextStyle(fontSize: 12.0),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ))
          ],
        ),
      ),
    );
  }
}
