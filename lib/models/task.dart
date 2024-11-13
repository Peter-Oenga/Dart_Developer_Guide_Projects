// lib/models/task.dart
enum Priority {low, medium, high}
enum Category {personal, work, other}



class Task {
  String description;
  bool isCompleted;
  final String id;
  final (String description, bool isCompleted, Priority priority, Category category) data;

   Task({
    required this.id,
    required String description,
    Priority priority = Priority.medium,
    Category category = Category.other,
  }) : data = (description, false, priority, category);

  void toggleCompletion() {
    data.isCompleted = !data.isCompleted;
  }

   @override
  String toString() {
    return 'ID: $id | Description: ${data.description} | Completed: ${data.isCompleted} '
           '| Priority: ${data.priority} | Category: ${data.category}';
  }
}
