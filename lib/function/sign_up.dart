
import 'package:registration/app.dart';
import 'package:registration/function/sign_up_as_adminisrtator.dart';
import 'package:registration/function/sign_up_as_student.dart';
import 'package:registration/function/sign_up_as_teacher.dart';
import 'package:registration/function/validators/validator.dart';

void signUp() {
  bool isTerminated = true;
  do {
    print("""
Who would you like to Sign Up?
1. Teacher
2. Student
3. Admin
0. Back
""");
    var input = validator("Command");
    var option = int.tryParse(input);
    if (option != null) {
      if (option >= 0 && option <= 3) {
        switch (option) {
          case 0:
            isTerminated = true;
            break;
          case 1:
            authenticatedUser = signUpAsTeacher();
            break;
          case 2:
            authenticatedUser = signUpAsStudent();
            break;
          case 3:
            authenticatedUser = signUpAsAdmin();
        }
      } else {
        print("Incorrect value!");
      }
    } else {
      print("Incorrect value! Please try again");
    }
  } while (!isTerminated);
}
