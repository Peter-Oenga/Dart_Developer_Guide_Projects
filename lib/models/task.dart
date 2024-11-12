// lib/models/task.dart
class Task {
  String description;
  bool isCompleted;

  Task(this.description) : isCompleted = false;

  void toggleComplete() {
    isCompleted = !isCompleted;
  }

  @override
  String toString() {
    return '[${isCompleted ? 'x' : ' '}] $description';
  }
}
