
import 'package:flutter/material.dart';
import 'package:myapp/features/todo/domain/models/todo.dart';

enum SortOption { date, alphabetical, completed }

class TodoProvider with ChangeNotifier {
  final List<Todo> _todos = [];
  SortOption _sortOption = SortOption.date;

  List<Todo> get todos {
    _sortTodos();
    return _todos;
  }

  SortOption get sortOption => _sortOption;

  void addTodo(String description, {String? title}) {
    final newTodo = Todo(
      id: DateTime.now().toString(),
      title: title,
      description: description,
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

  void changeSortOption(SortOption option) {
    _sortOption = option;
    notifyListeners();
  }

  void _sortTodos() {
    switch (_sortOption) {
      case SortOption.alphabetical:
        _todos.sort((a, b) => a.description.compareTo(b.description));
        break;
      case SortOption.completed:
        _todos.sort((a, b) {
          if (a.isCompleted && !b.isCompleted) return -1;
          if (!a.isCompleted && b.isCompleted) return 1;
          return 0;
        });
        break;
      case SortOption.date:
        _todos.sort((a, b) => b.id.compareTo(a.id));
        break;
    }
  }
}
