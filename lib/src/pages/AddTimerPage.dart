import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:monitr/src/components/TImerForm.dart';

class AddTimerPageState extends State<AddTimerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Timer'),
      ),
      body: TimerForm()
    );
  }
}

class AddTimerPage extends StatefulWidget {
  @override
  AddTimerPageState createState() => AddTimerPageState();
}
