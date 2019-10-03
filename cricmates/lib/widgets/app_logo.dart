import 'package:flutter/material.dart';
import 'package:cricmates/utils/images.dart';
import 'package:cricmates/utils/screen.dart';
import 'package:cricmates/utils/strings.dart';

class AppLogoWidget extends StatelessWidget {
  final double size;
  final String image;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;

  const AppLogoWidget(
      {Key key, this.margin, this.padding, this.size, this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: Strings.appName,
      child: Container(
        margin: margin ?? EdgeInsets.zero,
        padding: padding ?? ScreenSize.spacingAllSmall,
        child: Image(
          image: AssetImage(image ?? Images.appLogo),
          height: size ?? ScreenSize.defaultImageHeight,
          width: size ?? ScreenSize.defaultImageHeight,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / 10),
      child: Text(
        Strings.appName,
        style: TextStyle(
          fontFamily: 'Pacifico-Regular',
          fontSize: FontSize.s26,
          color: Color(0xFF008482),
          shadows: [
            Shadow(
                // bottomLeft
                offset: Offset(-1.5, -1.5),
                color: Colors.black),
            Shadow(
                // bottomRight
                offset: Offset(1.5, -1.5),
                color: Colors.black),
            Shadow(
                // topRight
                offset: Offset(1.5, 1.5),
                color: Colors.black),
            Shadow(
                // topLeft
                offset: Offset(-1.5, 1.5),
                color: Colors.black),
          ],
          letterSpacing: 5.0,
          inherit: false,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
