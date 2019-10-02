import 'package:flutter/material.dart';
import 'package:cricmates/utils/colors.dart';
import 'package:cricmates/utils/screen.dart';
import 'package:cricmates/utils/font.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData lightTheme = ThemeData(
      fontFamily: FontFamily.regular,
      scaffoldBackgroundColor: AppColors.appBackground,
      brightness: Brightness.light,
      textTheme: lightTextTheme);

  static final ThemeData darkTheme = ThemeData(
      fontFamily: FontFamily.regular,
      scaffoldBackgroundColor: Colors.black,
      brightness: Brightness.dark,
      textTheme: darkTextTheme);

  static final TextTheme lightTextTheme = TextTheme(
      title: _titleLight, subtitle: _subTitleLight, button: _buttonLight);

  static final TextTheme darkTextTheme = TextTheme(
      title: _titleDark, subtitle: _subTitleDark, button: _buttonDark);

  // light text style
  static final TextStyle _titleLight = TextStyle(
      color: Colors.black,
      fontFamily: FontFamily.bold,
      fontSize: FontSize.s24,
      inherit: false);

  static final TextStyle _subTitleLight = TextStyle(
      color: AppColors.subTitleText,
      fontSize: FontSize.s14,
      height: 1.5,
      inherit: false);

  static final TextStyle _buttonLight =
      TextStyle(color: Colors.white, fontSize: FontSize.s15, inherit: false);

  // dark text style
  static final TextStyle _titleDark = _titleLight.copyWith(color: Colors.white);
  static final TextStyle _subTitleDark = _subTitleLight.copyWith(color: Colors.white70);
  static final TextStyle _buttonDark = _buttonLight.copyWith(color: Colors.black);

//  static final TextStyle loginTitle = TextStyle(
//    fontFamily: FontFamily.bold,
//    fontSize: 32,
//    color: Colors.black,
//    inherit: false,
//  );

  static TextStyle get loginTitle => TextStyle(
        fontFamily: FontFamily.title,
        fontWeight: FontWeight.bold,
        fontSize: FontSize.s24,
        color: Colors.white,
        inherit: false,
      );

  static TextStyle get loginSubTitle => TextStyle(
        fontFamily: FontFamily.regular,
        fontSize: FontSize.s14,
        color: Colors.grey,
        inherit: false,
      );
}
