import 'package:flutter/material.dart';

class AppColors {
  AppColors._();
  static const Color primary = const Color(0xFF1976D2);
  static const Color primaryLight = const Color(0xFFFF9F59);
  static const Color primaryDark = const Color(0xFF651FFF);

  static const Color secondary = const Color(0xFFFF9F59);
  static const Color secondaryLight = const Color(0xFFFF9F59);
  static const Color secondaryDark = const Color(0xFFFF9F59);

  static const Color appBackground = Color(0xFFFFF7EC);
  static const Color appToolBar = Color(0xFFFFD974);
  static const Color subTitleText = Color(0xFF8F9988F);

  static const Color gradientStart = const Color(0xFF1976D2);
  static const Color gradientEnd = const Color(0xFFf7418c);
  static const primaryGradient = const LinearGradient(
    colors: const [gradientStart, gradientEnd],
    stops: const [0.0, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter
  );

  static const chatBubbleGradient = const LinearGradient(
    colors: const [Color(0xFFFD60A3), Color(0xFFFF8961)],
    begin: Alignment.topRight,
    end: Alignment.bottomLeft
  );

  static const chatBubbleGradient2 = const LinearGradient(
    colors: const [Color(0xFFf4e3e3), Color(0xFFf4e3e3)],
    begin: Alignment.topRight,
    end: Alignment.bottomLeft
  );
}
