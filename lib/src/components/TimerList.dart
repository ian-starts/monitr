import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';

class TimerList extends StatelessWidget {
  TimerList({@required this.items});

  final List<Widget> items;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: items.length,
        itemBuilder: /*1*/ (context, i) {
          return items[i];
        });
  }
}
