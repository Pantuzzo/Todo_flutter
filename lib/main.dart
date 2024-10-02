import 'package:flutter/material.dart';
import 'package:todo_new/todo_page.dart';

void main() {
  runApp(TodoApp());
}

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Tarefas',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: TodoListScreen(),
    );
  }
}
