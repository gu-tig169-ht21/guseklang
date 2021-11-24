// ignore_for_file: prefer_const_constructors, avoid_types_as_parameter_names, use_key_in_widget_constructors, unused_import, unused_element

import 'package:flutter/material.dart';
import './second_view.dart';
import 'package:provider/provider.dart';
import './model.dart';
import './main_list.dart';

void main() {
  var state = MyState();
  state.getList();

  runApp(
    ChangeNotifierProvider(
      create: (context) => state,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
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
        title: Text('TIG169 TODO'),
        centerTitle: true,
        actions: [
          PopupMenuButton<int>(
              onSelected: (value) {
                Provider.of<MyState>(context, listen: false).setFilterBy(value);
              },
              itemBuilder: (context) => [
                    PopupMenuItem(child: Text('All'), value: 0),
                    PopupMenuItem(child: Text('Done'), value: 1),
                    PopupMenuItem(child: Text('Not done'), value: 2),
                  ]),
        ],
      ),
      body: MainList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => second_view()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
