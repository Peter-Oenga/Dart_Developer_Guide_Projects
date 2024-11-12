// lib/services/task_service.dart
import '../models/task.dart';
import '../utils/input_util.dart';

class TaskService {
  List<Task> _tasks = [];

  void addTask() {
    print('Enter task description:');
    String description = InputUtil.getUserInput();

    if (description.isNotEmpty) {
      _tasks.add(Task(description));
      print('Task added successfully.');
    } else {
      print('Task description cannot be empty.');
    }
  }

  void viewTasks() {
    if (_tasks.isEmpty) {
      print('No tasks available.');
    } else {
      for (int i = 0; i < _tasks.length; i++) {
        print('${i + 1}. ${_tasks[i]}');
      }
    }
  }

  void markTaskComplete() {
    viewTasks();
    if (_tasks.isNotEmpty) {
      print('Enter task number to toggle completion status:');
      int index = InputUtil.getTaskIndex(_tasks.length);

      if (index != -1) {
        _tasks[index].toggleComplete();
        print('Task status updated.');
      }
    }
  }

  void deleteTask() {
    viewTasks();
    if (_tasks.isNotEmpty) {
      print('Enter task number to delete:');
      int index = InputUtil.getTaskIndex(_tasks.length);

      if (index != -1) {
        _tasks.removeAt(index);
        print('Task deleted successfully.');
      }
    }
  }
}
