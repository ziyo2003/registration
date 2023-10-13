import 'dart:io';

import 'package:registration/app.dart';
import 'package:registration/function/clear_terminal.dart';
import 'package:registration/function/login.dart';
import 'package:registration/function/show_allusers.dart';
import 'package:registration/function/sign_up.dart';
import 'package:registration/function/terminate_app.dart';

void showAuthScreen() {
  String? input = stdin.readLineSync();

  if (input == null) {
    print("You have not entered any command!");
  } else {
    // Yaroqsiz qiymat kiritish
    var parsedInput = int.tryParse(input);

    if (parsedInput == null) {
      print("Incorrect value!");
    } else {
      clearTerminal();
      if (parsedInput <= 3 && parsedInput >= 0) {
        switch (parsedInput) {
          case 0:
            isTerminated = terminateApp();
            break;
          case 1:
            signUp();
            break;
          case 2:
            login();
            break;
          case 3:
            showAllUsers(4);
            break;
          default:
        }
      } else {
        print("Your command is not found.Plaese enter a correct command!");
      }
    }
  }
}
