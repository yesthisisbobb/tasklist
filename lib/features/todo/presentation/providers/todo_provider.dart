
import 'package:flutter/material.dart';
import 'package:myapp/features/todo/domain/models/todo.dart';

class TodoProvider with ChangeNotifier {
  final List<Todo> _todos = [];

  List<Todo> get todos => _todos;

  void addTodo(String title) {
    final newTodo = Todo(
      id: DateTime.now().toString(),
      title: title,
    );
    _todos.add(newTodo);
    notifyListeners();
  }

  void toggleTodoStatus(String id) {
    final todo = _todos.firstWhere((todo) => todo.id == id);
    todo.isCompleted = !todo.isCompleted;
    notifyListeners();
  }

  void removeTodo(String id) {
    _todos.removeWhere((todo) => todo.id == id);
    notifyListeners();
  }
}
