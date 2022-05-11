import 'package:flutter/material.dart';
import 'package:tazah_tech_sale/config/app_screen_names.dart';
import 'package:tazah_tech_sale/config/app_constants.dart';
import 'package:tazah_tech_sale/views/screens/auth_screen.dart';
import 'package:tazah_tech_sale/views/screens/home_screen.dart';

class AppRoutes {
  Route? generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case ScreenNames.homeScreen:
        return MaterialPageRoute(
          builder: (context) => const MyHomePage(title: 'Home'),
        );

      case ScreenNames.loginScreen:
        return MaterialPageRoute(builder: (context) => LoginScreen());
      default:
        return null;
    }
  }
}
