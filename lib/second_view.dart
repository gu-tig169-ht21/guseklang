// ignore_for_file: prefer_const_constructors, file_names, camel_case_types, must_be_immutable

import 'package:flutter/material.dart';
import 'model.dart';
import 'package:provider/provider.dart';

class second_view extends StatelessWidget {
  second_view({Key? key}) : super(key: key);
  final textcontroller = TextEditingController();
  String input = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TIG169 TODO'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(right: 15, left: 15),
            child: TextField(
              controller: textcontroller,
              decoration:
                  InputDecoration(hintText: 'What are you going to do?'),
            ),
          ),
          IconButton(
              onPressed: () {
                input = textcontroller.text;
                Provider.of<MyState>(context, listen: false)
                    .addText(Todo(message: input));
                textcontroller.clear();
              },
              icon: Icon(Icons.add)),
        ],
      ),
    );
  }
}
