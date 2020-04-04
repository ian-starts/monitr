import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';

class TimerList extends StatefulWidget {
  TimerList({@required this.itemCount, @required this.buildRow});

  final int itemCount;
  final Function buildRow;

  @override
  TimerListState createState() => TimerListState(this.itemCount, this.buildRow);
}

class TimerListState extends State<TimerList> {
  int itemCount;
  Function buildRow;

  TimerListState(this.itemCount, this.buildRow);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: itemCount,
        itemBuilder: /*1*/ (context, i) {
          /*2*/
          final index = i ~/ 2; /*3*/
          return this.buildRow(generateWordPairs().take(1).toList().first);
        });
  }
}
