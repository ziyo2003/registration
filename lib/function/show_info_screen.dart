import 'dart:io';


import 'package:registration/app.dart';
import 'package:registration/function/admin_hand.dart';
import 'package:registration/function/clear_terminal.dart';
import 'package:registration/function/deleteUser.dart';
import 'package:registration/function/edit_profile.dart';
import 'package:registration/function/edit_profile_techer.dart';
import 'package:registration/function/show_allusers.dart';
import 'package:registration/function/terminate_app.dart';
import 'package:registration/models/admin.dart';
import 'package:registration/models/student.dart';
import 'package:registration/models/teacher.dart';

void showInfoScreen() {
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
      if (parsedInput <= 4 && parsedInput >= 0) {
        switch (parsedInput) {
          case 0:
          isTerminated = terminateApp();
          break;
          case 1:
          // TODO 4: fix
          if(authenticatedUser.runtimeType == Admin){
            showAllUsers(4);
          }else{
            print(authenticatedUser);
            stdin.readLineSync();
            break;
          }
            break;
          case 2:
          // TODO 4: fix
          if(authenticatedUser.runtimeType == Student){
            authenticatedUser = editProfile();
          }else if(authenticatedUser.runtimeType == Teacher){
            authenticatedUser = editProfileTeacher();
          }else if(authenticatedUser.runtimeType == Admin){
             adminEditMenu();
          }
            break;
          case 3:

          if(authenticatedUser.runtimeType == Student){
          repository.students.removeWhere((element) => element.id == authenticatedUser!.id);
          authenticatedUser = null;
          }
          else if(authenticatedUser.runtimeType == Teacher){
          teacherRepository.teachers.removeWhere((element) => element.id == authenticatedUser!.id);
          authenticatedUser = null;
          break;
          
          }else if(authenticatedUser.runtimeType == Admin){
            delAdminUser();
            authenticatedUser = null;
          }
          case 4:
            authenticatedUser = null;
            break;
          default:
        }
      } else {
        print("Your command is not found.Plaese enter a correct command!");
      }
    }
  }
}
