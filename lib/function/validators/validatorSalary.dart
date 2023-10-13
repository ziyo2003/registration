import 'dart:io';

int validatorSalary(String type) {
  bool isTerminated = true;
  late String? input;
  do {
    isTerminated = true;
    print("Enter the -> ${type} : ");
    input = stdin.readLineSync();
    try {
      if (input == null || input.isEmpty) {
        throw Exception("$type can not be empty!");
      }
      int.parse(input);
    } catch (error) {
      print(
          "You entered an error value for $type . Please try again!");
      isTerminated = false;
    }
  } while (!isTerminated);
  return int.parse(input!);
}
