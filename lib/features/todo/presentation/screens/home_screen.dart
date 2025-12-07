
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/features/todo/presentation/providers/todo_provider.dart';
import 'package:myapp/features/todo/presentation/screens/add_todo_screen.dart';
import 'package:myapp/features/todo/presentation/widgets/todo_item.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<TodoProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My To-Do\'s',
          style: GoogleFonts.oswald(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          PopupMenuButton<SortOption>(
            onSelected: (option) => todoProvider.changeSortOption(option),
            icon: const Icon(Icons.sort),
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: SortOption.date,
                child: Text('Sort by Date'),
              ),
              const PopupMenuItem(
                value: SortOption.alphabetical,
                child: Text('Sort Alphabetically'),
              ),
              const PopupMenuItem(
                value: SortOption.completed,
                child: Text('Sort by Completed'),
              ),
            ],
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.0,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: todoProvider.todos.length,
        itemBuilder: (context, index) {
          final todo = todoProvider.todos[index];
          return TodoItem(
            todo: todo,
            onTap: () => todoProvider.toggleTodoStatus(todo.id),
            onDismissed: (_) => todoProvider.removeTodo(todo.id),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AddTodoScreen()),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
