import 'package:flutter/cupertino.dart';

class TimerList extends StatefulWidget {
  TimerList({Key key, this.itemCount, this.buildRow}) : super(key: key);
  final int itemCount;
  final Widget buildRow;

  @override
  TimerListState createState() => TimerListState(itemCount, buildRow);
}

class TimerListState extends State<TimerList> {
  int itemCount;
  Widget buildRow;

  TimerListState(this.itemCount, this.buildRow);

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      itemCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: itemCount,
        itemBuilder: /*1*/ (context, i) {
          /*2*/

          final index = i ~/ 2; /*3*/
          return buildRow;
        });
  }
}
