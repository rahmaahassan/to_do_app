import 'package:flutter/material.dart';
import 'package:todoapp/screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter TODO',
        theme: ThemeData(
          fontFamily: 'JosefinSans',
          primaryColor: Colors.blue,
          textTheme: TextTheme(
            headline1: TextStyle(
              fontSize: 30,
              color: Colors.white, fontWeight: FontWeight.bold,
            ),
            headline2: TextStyle(
              fontSize: 22,
              color: Colors.black.withAlpha(160), fontWeight: FontWeight.bold,
            ),
            headline3: TextStyle(
              fontSize: 20, color: Colors.white.withAlpha(140),
            ),
            headline4: TextStyle(
              fontSize: 16, color: Colors.black.withAlpha(120)
            ),
          ),
        ),
        home: Home(),
    );
  }
}