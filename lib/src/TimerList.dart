import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';

class TimerList extends StatefulWidget {
  TimerList({@required this.itemCount, @required this.buildRow});

  final int itemCount;
  final Function buildRow;

  @override
  TimerListState createState() => TimerListState();
}

class TimerListState extends State<TimerList> {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: widget.itemCount,
        itemBuilder: /*1*/ (context, i) {
          /*2*/
          final index = i ~/ 2; /*3*/
          return widget.buildRow(generateWordPairs().take(1).toList().first);
        });
  }
}
