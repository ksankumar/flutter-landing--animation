import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cricmates/app.dart';
import 'package:cricmates/utils/colors.dart';

void main() {
  setPortraitOrientation();
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: AppColors.primary));
  runApp(App());
}

setPortraitOrientation() async {
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
}
