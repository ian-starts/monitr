import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:monitr/src/components/TimerList.dart';

class HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TimerList(items: <Widget>[],),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/addTimer');
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}
