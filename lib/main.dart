import 'package:flutter/material.dart';
import 'package:monitr/src/pages/AddTimerPage.dart';
import 'package:monitr/src/pages/HomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: <String, WidgetBuilder>{
        '/home': (BuildContext context) => HomePage(),
        '/addTimer': (BuildContext context) => AddTimerPage(),
      },
      initialRoute: '/home',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
    );
  }
}