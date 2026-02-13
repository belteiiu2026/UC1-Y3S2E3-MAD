
import 'package:flutter/material.dart';
import 'package:mad/screen/home_screen.dart';
import 'package:mad/screen/splash_screen.dart';
import 'package:mad/util/route_manager.dart';

void main(){

  final app = MaterialApp(
    // Option 1
    home: SplashScreen(),

    // Option 2
    initialRoute: RouteManager.splashScreen,
    onGenerateRoute: RouteManager.generateRoute,

    theme: ThemeData(
      colorScheme: .fromSeed(seedColor: Colors.pinkAccent),
    ),
  );

  runApp(app);
}