// ignore_for_file: unnecessary_this, unused_import

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'main.dart';

class Todo {
  String message;
  bool? isChecked;

  Todo({required this.message, this.isChecked = false});
}

class MyState extends ChangeNotifier {
  final List<Todo> _list = [];
  int _filterBy = 0;

  List<Todo> get list => _list;

  int get filterBy => _filterBy;

  void addText(Todo text) {
    _list.add(text);
    notifyListeners();
  }

  void whenChanged(Todo item, value) {
    item.isChecked = value;
    notifyListeners();
  }

  void removeTodo(Todo item) {
    _list.remove(item);
    notifyListeners();
  }

  void setFilterBy(int filterBy) {
    this._filterBy = filterBy;
    notifyListeners();
  }
}
