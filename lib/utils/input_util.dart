// lib/utils/input_util.dart
import 'dart:io';

class InputUtil {
  static String getUserInput() {
    stdout.write('> ');
    return stdin.readLineSync() ?? '';
  }

  static int getTaskIndex(int max) {
    String input = getUserInput();
    int? index = int.tryParse(input);

    if (index != null && index > 0 && index <= max) {
      return index - 1;
    } else {
      print('Invalid task number.');
      return -1; // Error indicator
    }
  }
}
