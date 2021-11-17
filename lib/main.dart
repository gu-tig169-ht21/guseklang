// ignore_for_file: prefer_const_constructors, avoid_types_as_parameter_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainView(),
    );
  }
}

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  get value => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('TIG169 TODO'),
        ),
      ),
      body: _list(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SecondView()));
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _list() {
    var list = [
      'Write a book',
      'Do homework',
      'Tidy Room',
      'Watch TV',
      'Nap',
      'Shop groceries',
      'Have fun',
      'Meditate',
    ];

    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        return _checkBoxRow(list[index], index);
      },
    );
  }

  Widget _checkBoxRow(item, index) {
    return Row(
      children: [
        Checkbox(
          checkColor: Colors.white,
          value: false,
          onChanged: (bool) {},
        ),
        Text(
          item,
          style: TextStyle(fontSize: 15),
        ),
        Spacer(),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.delete_forever),
        )
      ],
    );
  }
}

class SecondView extends StatelessWidget {
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
              decoration:
                  InputDecoration(hintText: 'What are you going to do?'),
            ),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.add)),
        ],
      ),
    );
  }
}
