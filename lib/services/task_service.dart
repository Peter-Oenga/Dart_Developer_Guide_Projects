import '../models/task.dart';
import '../utils/id_util.dart';
import '../utils/input_util.dart';

class TaskService {
  // Organize tasks by category for easy access and filtering
  final Map<Category, List<Task>> _tasksByCategory = {
    Category.personal: [],
    Category.work: [],
    Category.other: [],
  };

  void addTask() {
    print('Enter task description:');
    String description = InputUtil.getStringInput('Description: ');

    if (description.isNotEmpty) {
      final priority = InputUtil.getPriorityInput();
      final category = InputUtil.getCategoryInput();
      final newTask = Task(
        id: IdUtil.generateId(),
        description: description,
        priority: priority,
        category: category,
      );

      _tasksByCategory[category]?.add(newTask);
      print('Task added successfully.');
    } else {
      print('Task description cannot be empty.');
    }
  }

  void viewTasks({bool? completed}) {
    bool noTasks = true;
    for (var category in _tasksByCategory.keys) {
      final tasks = _tasksByCategory[category]!;
      final filteredTasks = completed == null
          ? tasks
          : tasks.where((task) => task.data.isCompleted == completed).toList();
      
      if (filteredTasks.isNotEmpty) {
        noTasks = false;
        print('\nCategory: $category');
        for (int i = 0; i < filteredTasks.length; i++) {
          print('${i + 1}. ${filteredTasks[i]}');
        }
      }
    }
    if (noTasks) {
      print('No tasks available.');
    }
  }

  void markTaskComplete() {
    print('Select the category of the task:');
    final category = InputUtil.getCategoryInput();
    final tasks = _tasksByCategory[category];

    if (tasks != null && tasks.isNotEmpty) {
      for (int i = 0; i < tasks.length; i++) {
        print('${i + 1}. ${tasks[i]}');
      }

      print('Enter task number to toggle completion status:');
      int index = InputUtil.getTaskIndex(tasks.length);

      if (index != -1) {
        tasks[index].toggleCompletion();
        print('Task status updated.');
      }
    } else {
      print('No tasks available in this category.');
    }
  }

  void deleteTask() {
    print('Select the category of the task:');
    final category = InputUtil.getCategoryInput();
    final tasks = _tasksByCategory[category];

    if (tasks != null && tasks.isNotEmpty) {
      for (int i = 0; i < tasks.length; i++) {
        print('${i + 1}. ${tasks[i]}');
      }

      print('Enter task number to delete:');
      int index = InputUtil.getTaskIndex(tasks.length);

      if (index != -1) {
        tasks.removeAt(index);
        print('Task deleted successfully.');
      }
    } else {
      print('No tasks available in this category.');
    }
  }
}
