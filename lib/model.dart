// ignore_for_file: unnecessary_this, unused_import

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'main.dart';
import 'package:http/http.dart' as http;
import 'api.dart';
import 'dart:convert';

class Todo {
  String message;
  bool? isChecked;
  String id;

  Todo({required this.message, this.isChecked = false, this.id = ''});

  static Map<String, dynamic> toJson(Todo item) {
    return {
      'title': item.message,
      'done': item.isChecked,
    };
  }

  // Converting from json to a Todo object
  static Todo fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['id'],
      message: json['title'],
      isChecked: json['done'],
    );
  }
}

class MyState extends ChangeNotifier {
  List<Todo> _list = [];
  int _filterBy = 0;

  List<Todo> get list => _list;

  int get filterBy => _filterBy;

  Future getList() async {
    List<Todo> list = await FetchFromInternet.getTodo();
    _list = list;
    notifyListeners();
  }

  void addText(Todo text) async {
    _list = await FetchFromInternet.postTodo(text);
    notifyListeners();
  }

  void whenChanged(Todo item, value) async {
    await FetchFromInternet.putTodo(item, value);
    notifyListeners();
  }

  void removeTodo(Todo item) async {
    _list = await FetchFromInternet.deleteTodo(item.id);
    notifyListeners();
  }

  void setFilterBy(int filterBy) {
    this._filterBy = filterBy;
    notifyListeners();
  }
}
