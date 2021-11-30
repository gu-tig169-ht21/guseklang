// ignore_for_file: prefer_const_constructors_in_immutables, avoid_types_as_parameter_names, prefer_const_constructors

import 'package:flutter/material.dart';
import './model.dart';
import 'package:provider/provider.dart';

class MainList extends StatelessWidget {
  MainList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MyState>(
        builder: (context, state, child) =>
            _todolist(_filterList(state.list, state.filterBy)));
  }

  List<Todo> _filterList(list, filterBy) {
    if (filterBy == 0) return list;
    if (filterBy == 1) {
      return list.where((item) => item.isChecked == true).toList();
    }
    if (filterBy == 2) {
      return list.where((item) => item.isChecked == false).toList();
    }
    return list;
  }

  Widget _todolist(list) {
    return ListView.builder(
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          return _item(list[index], context);
        });
  }

  Widget _item(text, context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: CheckboxListTile(
          controlAffinity: ListTileControlAffinity.leading,
          checkColor: Colors.white,
          value: text.isChecked,
          onChanged: (bool? value) {
            Provider.of<MyState>(context, listen: false)
                .whenChanged(text, value);
          },
          title: Text(text.message,
              style: TextStyle(
                fontSize: 20,
                decoration: text.isChecked ? TextDecoration.lineThrough : null,
              )),
          secondary: IconButton(
            onPressed: () {
              Provider.of<MyState>(context, listen: false).removeTodo(text);
            },
            icon: Icon(Icons.delete_forever),
          )),
    );
  }
}
