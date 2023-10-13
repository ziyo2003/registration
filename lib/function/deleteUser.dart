import 'dart:io';

import 'package:registration/app.dart';
import 'package:registration/function/clear_terminal.dart';
import 'package:registration/function/show_allusers.dart';
import 'package:registration/function/show_menu.dart';
import 'package:registration/function/validators/validator.dart';

void delAdminUser(){
  bool isFound = false;
  bool isTerminated = false;
  do {
    clearTerminal();
  print("""
Who would you like to Delete?
1. Teacher
2. Student
3. My Profile
0. Back
""");
    var input = validator("Command");
    var command = int.tryParse(input) ?? -1;

    if (command == -1) {
      print("Incorrect value!");
    } else if(command == 0 || command == 1 || command ==2 || command ==3){
      switch(command){
        case 0:{
            showMenu();
            isTerminated = true;
          break;
        }
        case 1:{
            showAllUsers(1);
            print("Enter Teacher ID which you want to Delete:");
            var id = validator("Teacher ID");

            var teachers = teacherRepository.fetchTeachers();
            late var teacherToRemove;

            for(var teacher in teachers){
              if(teacher.id == id){
                teacherToRemove = teacher;
              isFound = true;
              }
            }

            if(isFound){
              teacherRepository.teachers.remove(teacherToRemove);
            }
      print(isFound ? "Deleted Succsessfuly!":"User not found ! Try again");
        stdin.readLineSync()!;
              delAdminUser();
              isTerminated = true;
          break;
        }
        case 2:{
            showAllUsers(2);
            print("Enter Student ID which you want to Delete:");
            var id = validator("Student ID");

            var students = repository.fetchStudents();
            late var studentToRemove;

            for(var student in students){
              if(student.id == id){
                studentToRemove = student;
              isFound = true;              
              }
            }
            if(isFound){
            repository.students.remove(studentToRemove);
            }
      print(isFound ? "Deleted Succsessfuly!":"User not found ! Try again");
        stdin.readLineSync();
            delAdminUser();
            isTerminated = true;
          break;
        }
        case 3: {
            adminRepository.admins.removeWhere((element) => element.id == authenticatedUser!.id);
            authenticatedUser = null;
            isTerminated = true;
            showMenu();
          break;
              }
      }
      }else{
        print("Incorrect value! Please try again");
      }
  }while (!isTerminated);
}
