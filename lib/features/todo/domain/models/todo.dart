
class Todo {
  final String id;
  final String? title;
  final String description;
  bool isCompleted;

  Todo({
    required this.id,
    this.title,
    required this.description,
    this.isCompleted = false,
  });
}
