import 'package:cricmates/views/auth/customLogin.dart';
import 'package:cricmates/views/auth/manoj_login.dart';
import 'package:flutter/material.dart';
import 'package:cricmates/routing/animation.dart';
import 'package:cricmates/routing/routes.dart';
import 'package:cricmates/views/auth/new_login.dart';
import 'package:cricmates/views/home/home.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case home:
      return SlideRightRoute(widget: Home());
    case login:
      return SlideRightRoute(widget: CustomLogin());
    default:
      return SlideRightRoute(widget: Home());
  }
}
