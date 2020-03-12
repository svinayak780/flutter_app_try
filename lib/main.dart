import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutterapptry/ui/mortgage_app.dart';

import 'ui/home.dart';
import 'ui/quiz.dart';
import 'ui/movies.dart';

void main() {
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
    if (kReleaseMode) exit(1);
  };
  runApp(new MaterialApp(
    theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xff090909),
        accentColor: Colors.white70,

//      accentColor: Color(0xff0077c2),
        cardColor: Color(0xff484848),
        scaffoldBackgroundColor: Color(0xff000000),
        appBarTheme: AppBarTheme(elevation: 8),
        cardTheme: CardTheme(
            color: Color(0xff212121), clipBehavior: Clip.none, elevation: 2),
        textTheme: TextTheme(
            body1: TextStyle(
                color: Colors.white, fontSize: 18, fontFamily: "Roboto")),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(fontSize: 30),
          counterStyle: TextStyle(fontSize: 30),
          helperStyle: TextStyle(fontSize: 30),
//          focusedBorder: Border
        )),
    home: MortgageApp(),
  ));
}
