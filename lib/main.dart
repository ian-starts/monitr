import 'package:flutter/material.dart';
import 'package:monitr/src/pages/AddTimerPage.dart';
import 'package:monitr/src/pages/HomePage.dart';
import 'package:monitr/src/pages/HttpRequestsPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: <String, WidgetBuilder>{
        '/home': (BuildContext context) => HomePage(),
        '/addTimer': (BuildContext context) => AddTimerPage(),
//        '/httpRequests': (BuildContext context) => HttpRequest(),
      },
      initialRoute: '/home',
      theme:ThemeData.from(colorScheme: ColorScheme.dark(secondary: Colors.blueGrey)),
      darkTheme: ThemeData.from(colorScheme: ColorScheme.dark(secondary: Colors.red)),
    );
  }
}