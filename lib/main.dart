import 'dart:io';
import 'models/task.dart';
import 'services/task_service.dart';
import 'utils/input_util.dart';

void main() {
  TaskService taskService = TaskService();

  while (true) {
    printMenu();
    String choice = InputUtil.getUserInput('Enter your choice');

    switch (choice) {
      case '1':
        taskService.addTask();
        break;
      case '2':
        taskService.viewTasks();
        break;
      case '3':
        taskService.markTaskComplete();
        break;
      case '4':
        taskService.deleteTask();
        break;
      case '5':
        print('Goodbye!');
        exit(0);
      default:
        print('Invalid choice. Please try again.');
    }
  }
}

// Display the main menu to the user
void printMenu() {
  print('\n=== To-Do List Menu ===');
  print('1. Add Task');
  print('2. View Tasks');
  print('3. Mark Task as Complete');
  print('4. Delete Task');
  print('5. Exit');
}
