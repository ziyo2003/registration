import 'dart:io';

import 'package:registration/app.dart';
import 'package:registration/function/clear_terminal.dart';
import 'package:registration/function/validators/validator.dart';
import 'package:registration/function/validators/validator_password.dart';
import 'package:registration/models/authenticated_user.dart';

void login() {
  bool isTerminated = true;

  do {
    clearTerminal();
    print("""
Who would you like to enter?
1. Teacher
2. Student
3. Admin
0. Back
""");

    var input = validator("Command");

    var command = int.tryParse(input) ?? -1;

    if (command == -1) {
      print("Incorrect value!");
    } else {
      if (command == 0) {
        isTerminated = true;
      } else if (command == 1 || command == 2 || command == 3) {
        authenticatedUser = loginAsUser(command);
      } else {
        print("Incorrect value! Please try again");
      }
    }
  } while (!isTerminated);
}

AuthenticatedUser? loginAsUser(int command) {
  AuthenticatedUser? authenticatedUser;
  var id = validator("Id");
  var password = validatorPassword("Password");

  try {
    if (command == 1) {
      authenticatedUser = teacherRepository.fetchTeacher(id, password);
    } else if(command == 2) {
      authenticatedUser = repository.fetchStudent(id, password);
    }else{
      authenticatedUser = adminRepository.fetchAdmin(id, password);
    }
  } catch (e) {
    print("User not found!");
    stdin.readLineSync();
  }

  return authenticatedUser;
}
