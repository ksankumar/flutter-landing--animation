import 'package:flutter/material.dart';
import 'package:cricmates/utils/theme.dart';
import 'package:cricmates/routing/routes.dart';
import 'package:cricmates/routing/router.dart' as router;

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return MaterialApp(
        title: 'CricMates',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        onGenerateRoute: router.generateRoute,
        initialRoute: login,
      );
    });
  }
}
