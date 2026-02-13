
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mad/screen/language_screen.dart';
import 'package:mad/screen/main_screen.dart';
import 'package:mad/screen/splash_screen.dart';

class RouteManager {

  static const String splashScreen = "/";
  static const String mainScreen = "/mainScreen";
  static const String languageScreen = "/languageScreen";

  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case splashScreen:
        return  _buildRoute(settings, SplashScreen());
      case mainScreen:
        return _buildRoute(settings, MainScreen());
      case languageScreen:
        return _buildRoute(settings, LanguageScreen());
      default:
        throw("Route not found");
    }
  }
  static Route<dynamic> _buildRoute(RouteSettings settings, Widget route){
    return MaterialPageRoute(
        settings: settings,
        builder: (BuildContext context) => route);
  }
}