
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/features/todo/presentation/providers/todo_provider.dart';
import 'package:provider/provider.dart';

class AddTodoScreen extends StatefulWidget {
  const AddTodoScreen({super.key});

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add a New To-Do',
          style: GoogleFonts.oswald(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                hintText: 'Enter a title (optional)...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(
                hintText: 'Enter a to-do...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            const SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {
                if (_descriptionController.text.isNotEmpty) {
                  Provider.of<TodoProvider>(context, listen: false).addTodo(
                    _descriptionController.text,
                    title: _titleController.text.isNotEmpty ? _titleController.text : null,
                  );
                  Navigator.pop(context);
                }
              },
              child: const Text('Add To-Do'),
            ),
          ],
        ),
      ),
    );
  }
}
