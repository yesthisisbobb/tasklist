
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/features/todo/presentation/providers/todo_provider.dart';
import 'package:myapp/features/todo/presentation/widgets/todo_item.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<TodoProvider>(context);
    final TextEditingController textEditingController = TextEditingController();

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
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
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
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: textEditingController,
                    decoration: InputDecoration(
                      hintText: 'Enter a new to-do...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16.0),
                ElevatedButton(
                  onPressed: () {
                    if (textEditingController.text.isNotEmpty) {
                      todoProvider.addTodo(textEditingController.text);
                      textEditingController.clear();
                    }
                  },
                  child: const Text('Add'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
