
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
        alignment: Alignment.center,
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          elevation: 4.0,
          margin: const EdgeInsets.all(8.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Stack(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (todo.title != null && todo.title!.isNotEmpty)
                        Text(
                          todo.title!,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            decoration: todo.isCompleted ? TextDecoration.lineThrough : null,
                            color: todo.isCompleted ? Colors.grey : Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                      if (todo.title != null && todo.title!.isNotEmpty)
                        const SizedBox(height: 8.0),
                      Text(
                        todo.description,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          decoration: todo.isCompleted ? TextDecoration.lineThrough : null,
                          color: todo.isCompleted ? Colors.grey : Theme.of(context).colorScheme.onSurface.withAlpha(204),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 4.0,
                right: 4.0,
                child: IconButton(
                  icon: const Icon(Icons.more_vert),
                  onPressed: () {
                    // Placeholder for more options
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
