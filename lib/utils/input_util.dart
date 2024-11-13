import 'dart:io';
import '../models/task.dart';

class InputUtil {
  // Get a general string input from the user
  static String getUserInput(String prompt) {
    stdout.write('$prompt > ');
    return stdin.readLineSync() ?? '';
  }

  // Get the index of a task from the user within a valid range
  static int getTaskIndex(int max) {
    String input = getUserInput('Enter task number');
    int? index = int.tryParse(input);

    if (index != null && index > 0 && index <= max) {
      return index - 1; // Adjust for 0-based index
    } else {
      print('Invalid task number.');
      return -1; // Error indicator
    }
  }

  // Get priority input from the user and map it to the Priority enum
  static Priority getPriorityInput() {
    print('Select Priority:');
    print('1. Low');
    print('2. Medium');
    print('3. High');
    stdout.write('Enter priority (1-3): ');
    
    int choice = int.tryParse(stdin.readLineSync() ?? '0') ?? 0;
    switch (choice) {
      case 1:
        return Priority.low;
      case 2:
        return Priority.medium;
      case 3:
        return Priority.high;
      default:
        print('Invalid choice, defaulting to Medium priority.');
        return Priority.medium;
    }
  }

  // Get category input from the user and map it to the Category enum
  static Category getCategoryInput() {
    print('Select Category:');
    print('1. Personal');
    print('2. Work');
    print('3. Other');
    stdout.write('Enter category (1-3): ');
    
    int choice = int.tryParse(stdin.readLineSync() ?? '0') ?? 0;
    switch (choice) {
      case 1:
        return Category.personal;
      case 2:
        return Category.work;
      case 3:
        return Category.other;
      default:
        print('Invalid choice, defaulting to Other category.');
        return Category.other;
    }
  }
}
