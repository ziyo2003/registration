import 'dart:io';

import 'package:registration/app.dart';
import 'package:registration/consts/contants.dart';
import 'package:registration/function/add_user.dart';
import 'package:registration/function/clear_terminal.dart';
import 'package:registration/function/deleteUser.dart';
import 'package:registration/function/edit_profile_admin.dart';
import 'package:registration/function/show_menu.dart';

void adminEditMenu() {
  isTerminated = false;
  do {
    clearTerminal();
    print(AppConstans.adminEditProfileText);

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
        if (parsedInput <= 5 && parsedInput >= 0) {
          switch (parsedInput) {
            case 0:
              showMenu();
              break;
            case 1:
              editProfileAdmin();
              break;
            case 2:
              addMenu();
              break;
            case 3:
              delAdminUser();
              break;
            default:
          }
        } else {
          print("Your command is not found.Plaese enter a correct command!");
        }
      }
    }
  } while (!isTerminated);
}
