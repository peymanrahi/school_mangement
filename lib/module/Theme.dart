import 'package:flutter/material.dart';

enum AppTheme{Dark, Light}

final Map<AppTheme, ThemeData> appThemeData = {

AppTheme.Light: ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.blue,
  primaryColor: Colors.blue,
  accentColor: Colors.blueAccent,
  scaffoldBackgroundColor: Colors.white,
  bottomAppBarColor: Colors.grey.shade100,
  textTheme: TextTheme(
    headline1: TextStyle(color: Colors.grey.shade100)
  )
),

  AppTheme.Dark: ThemeData(
      brightness: Brightness.dark,
      primarySwatch: Colors.blueGrey,
      primaryColor: Color(0xFF294c60),
      accentColor: Colors.lightBlueAccent,
      scaffoldBackgroundColor: Colors.white,
      bottomAppBarColor: Colors.grey.shade700,
      textTheme: TextTheme(
          headline1: TextStyle(color: Colors.white70)
      )
  )



};