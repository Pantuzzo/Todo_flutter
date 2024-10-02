import 'package:flutter/material.dart';

class TodoListScreen extends StatefulWidget {
  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  final List<Todo> _todos = [];
  final TextEditingController _textController = TextEditingController();

  void _addTodoItem(String task) {
    if (task.isNotEmpty) {
      setState(() {
        _todos.add(Todo(task: task));
      });
    }
  }

  void _toggleTodoStatus(Todo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _removeTodoItem(int index) {
    setState(() {
      _todos.removeAt(index);
    });
  }

  Widget _buildTodoItem(Todo todo, int index) {
    return ListTile(
      title: Text(
        todo.task,
        style: TextStyle(
          decoration: todo.isDone ? TextDecoration.lineThrough : null,
        ),
      ),
      leading: Checkbox(
        value: todo.isDone,
        onChanged: (value) {
          _toggleTodoStatus(todo);
        },
      ),
      trailing: IconButton(
        icon: Icon(Icons.delete, color: Colors.red),
        onPressed: () => _removeTodoItem(index),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Tarefas'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    decoration:
                        InputDecoration(labelText: 'Adicione uma nova Tarefa'),
                  ),
                ),
                IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      _addTodoItem(_textController.text);
                    })
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: _todos.length,
                itemBuilder: (context, index) {
                  return _buildTodoItem(_todos[index], index);
                }),
          )
        ],
      ),
    );
  }
}

class Todo {
  String task;
  bool isDone;

  Todo({this.task = '', this.isDone = false});
}
