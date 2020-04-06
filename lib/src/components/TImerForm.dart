import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:monitr/src/pages/HttpRequestsPage.dart';
import 'dart:async';

class TimerFormState extends State<TimerForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController controller = new TextEditingController();
  GlobalKey<AutoCompleteTextFieldState<String>> key = new GlobalKey();


  @override
  Widget build(BuildContext context){
    // Build a Form widget using the _formKey created above
    // .
    return Form(
        key: _formKey,
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 10),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 3.0),
                      icon: Icon(Icons.timer),
                      hintText: 'What do you want to call the timer?',
                      labelText: 'Timer Name',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Add timer';
                      }
                      return null;
                    },
                  ),
                  AutoCompleteTextField<String>(
                    decoration: new InputDecoration(
                        contentPadding:
                         EdgeInsets.symmetric(horizontal: 3.0),
                        icon: Icon(Icons.folder_open),
                        filled: true,
                        labelText: "Project",
                        hintText: 'Select the project',
                        hintStyle: TextStyle(color: Colors.black)),
                        itemBuilder: (context, item) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    item,
                                    style: TextStyle(fontSize: 16.0),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(15.0),
                                  ),
                                  Text(
                                    item,
                                  )
                                ],
                              );
                    },
                    itemFilter: (item, query) {
                      return item
                          .toLowerCase()
                          .startsWith(query.toLowerCase());
                    },
                    itemSorter: (a, b) {
                      return a.compareTo(b);
                    },
                    itemSubmitted: (item) {
                      setState(() => this.controller.text = item);
                    },
                    key: key,
                    suggestions: ['one', 'two', 'three'],
                    clearOnSubmit: false,
                  ),
//                  DropdownButtonFormField<String>(
//                    value: dropdownValue,
//                    decoration: (
//                      InputDecoration(
//                        labelText: 'Project',
//                        hintText: 'Under what project do you want this timer?',
//                      )
//                    ),
//                    icon: Icon(Icons.arrow_downward),
//                    iconSize: 24,
//                    elevation: 16,
//                    onChanged: (String newValue) {
//                      setState(() {
//                        dropdownValue = newValue;
//                      });
//                    },
//                    items: <String>['Project', 'Two', 'Free', 'Four']
//                        .map<DropdownMenuItem<String>>((String value) {
//                      return DropdownMenuItem<String>(
//                        value: value,
//                        child: Text(value),
//                      );
//                    })
//                        .toList(),
//                  )
                ])));
  }
}

class TimerForm extends StatefulWidget {
  @override
  TimerFormState createState() => TimerFormState();
}
