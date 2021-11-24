// ignore_for_file: constant_identifier_names, avoid_print, unused_import, unused_local_variable

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './model.dart';
import 'dart:convert';

const API_KEY = '68551a72-0a08-4831-87ae-bf366de759e4';
const API_URL = 'https://todoapp-api-pyq5q.ondigitalocean.app';

class FetchFromInternet {
  static Future<List<Todo>> getTodo() async {
    var response = await http.get(Uri.parse('$API_URL/todos?key=$API_KEY'));
    String bodyString = response.body;
    print(bodyString);
    var json = jsonDecode(bodyString);

    return json.map<Todo>((data) {
      return Todo.fromJson(data);
    }).toList();
  }

  static Future<List<Todo>> postTodo(Todo todo) async {
    Map<String, dynamic> json = Todo.toJson(todo);
    var bodyString = jsonEncode(json);
    var response = await http.post(
      Uri.parse('$API_URL/todos?key=$API_KEY'),
      body: bodyString,
      headers: {'Content-Type': 'application/json'},
    );
    bodyString = response.body;
    var list = jsonDecode(bodyString);

    return list.map<Todo>((data) {
      return Todo.fromJson(data);
    }).toList();
  }

  static Future putTodo(Todo item, value) async {
    String todoId = item.id;
    item.isChecked = value;
    Map<String, dynamic> json = Todo.toJson(item);
    var bodyString = jsonEncode(json);
    var response = await http.put(
      Uri.parse('$API_URL/todos/$todoId?key=$API_KEY'),
      body: bodyString,
      headers: {'Content-Type': 'application/json'},
    );
  }

  static Future deleteTodo(String todoId) async {
    var response = await http
        .delete(Uri.parse('$API_URL/todos/$todoId?key=$API_KEY&_confirm=true'));
    var bodyString = response.body;
    var list = jsonDecode(bodyString);

    return list.map<Todo>((data) {
      return Todo.fromJson(data);
    }).toList();
  }
}
