
import 'package:registration/function/clear_terminal.dart';
import 'package:registration/function/sign_up_as_student.dart';
import 'package:registration/function/sign_up_as_teacher.dart';
import 'package:registration/function/validators/validator.dart';

void addMenu() {
  bool isTerminated = false;
  do {
    clearTerminal();
    print("""
Who would you like to Add?
1. Teacher
2. Student
0. Back
""");
    var input = validator("Command");
    var command = int.tryParse(input) ?? -1;
    if (command == -1) {
      print("Incorrect value!");
    }
    if (command == -1) {
      print("Incorrect value!");
    } else if(command == 0 || command == 1 || command ==2){
      switch(command){
        case 0:{
          isTerminated = true;
          break;
        }
        case 1:{
          signUpAsTeacher();
          break;
        }
        case 2:{
          signUpAsStudent();
          break;
        }
      }
      }else{
        print("Incorrect value! Please try again");

      }
  }while (!isTerminated);
}