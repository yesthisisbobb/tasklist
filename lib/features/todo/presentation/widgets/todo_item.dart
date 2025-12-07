
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/features/todo/domain/models/todo.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;
  final VoidCallback onTap;
  final DismissDirectionCallback onDismissed;

  const TodoItem({
    super.key,
    required this.todo,
    required this.onTap,
    required this.onDismissed,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(todo.id),
      onDismissed: onDismissed,
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20.0),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: ListTile(
          onTap: onTap,
          leading: Icon(
            todo.isCompleted ? Icons.check_box : Icons.check_box_outline_blank,
            color: todo.isCompleted ? Colors.green : null,
          ),
          title: Text(
            todo.title,
            style: GoogleFonts.roboto(
              fontSize: 16,
              decoration: todo.isCompleted ? TextDecoration.lineThrough : null,
            ),
          ),
        ),
      ),
    );
  }
}
