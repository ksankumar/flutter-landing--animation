import 'package:flutter/material.dart';
//import 'package:cricmates/utils/colors.dart';
import 'package:cricmates/utils/screen.dart';
import 'package:cricmates/utils/font.dart';

class TextStyles {
  static TextStyle get snackBarText =>
      TextStyle(
        fontFamily: FontFamily.medium,
        fontSize: FontSize.s15,
        color: Colors.white,
        letterSpacing: 1.4,
        inherit: false,
      );

  static TextStyle get appName =>
      TextStyle(
        fontFamily: FontFamily.title,
        fontSize: FontSize.s26,
        fontWeight: FontWeight.bold,
        color: Colors.pink,
        shadows: [
          Shadow(
          // bottomLeft
              offset: Offset(-0.5, -0.5),
              color: Colors.black),
          Shadow(
          // bottomRight
              offset: Offset(0.5, -0.5),
              color: Colors.black),
          Shadow(
          // topRight
              offset: Offset(0.5, 0.5),
              color: Colors.black),
          Shadow(
          // topLeft
              offset: Offset(-0.5, 0.5),
              color: Colors.black),
        ],
        letterSpacing: 5.0,
        inherit: false,
      );

  static TextStyle get editText =>
      TextStyle(
        fontFamily: FontFamily.regular,
        fontSize: FontSize.s16,
        color: Colors.black,
        inherit: false,
        textBaseline: TextBaseline.alphabetic,
        letterSpacing: 3.0,
      );

  static TextStyle get labelStyle =>
      TextStyle(
        fontFamily: FontFamily.regular,
        fontSize: FontSize.s16,
        color: Colors.grey,
        inherit: false,
      );

  static TextStyle get errorStyle =>
      TextStyle(
        fontFamily: FontFamily.regular,
        fontSize: FontSize.s12,
        color: Colors.red,
        inherit: false,
      );

  static TextStyle get buttonText =>
      TextStyle(
        fontFamily: FontFamily.medium,
        fontSize: FontSize.s18,
        fontWeight: FontWeight.bold,
        color: Colors.white,
        inherit: false,
      );

  static TextStyle get linkText =>
      TextStyle(
        fontFamily: FontFamily.medium,
        fontSize: FontSize.s15,
        color: Color(0xFF6C63FF),
        inherit: false,
      );

  static TextStyle get loginTitle =>
      TextStyle(
        fontFamily: FontFamily.bold,
        fontSize: FontSize.s24,
        color: Colors.black,
        inherit: false,
      );

  static TextStyle get loginSubTitle =>
      TextStyle(
        fontFamily: FontFamily.regular,
        fontSize: FontSize.s14,
        color: Colors.grey,
        inherit: false,
      );
}
