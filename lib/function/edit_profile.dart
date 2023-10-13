
import 'package:registration/app.dart';
import 'package:registration/consts/contants.dart';
import 'package:registration/function/clear_terminal.dart';
import 'package:registration/function/validators/validator.dart';
import 'package:registration/function/validators/validator_email.dart';
import 'package:registration/function/validators/validator_password.dart';
import 'package:registration/models/student.dart';

Student editProfile() {
  bool isTerminated = false;
  final int index = repository.students.indexOf(authenticatedUser! as Student);
  do {
    clearTerminal();
    print(AppConstans.editProfileText);

    var input = validator("Command");

    final int task = int.tryParse(input) ?? -1;

    if (task >= 0 || task < 6) {
      switch (task) {
        case 0:
          isTerminated = true;
          break;
        case 1:
          final firstName = validator("Name");
          authenticatedUser = (authenticatedUser! as Student).copyWith(firstName: firstName);
          break;
        case 2:
          final lastName = validator("LastName");
          authenticatedUser = (authenticatedUser! as Student).copyWith(lastName: lastName);
          break;
        case 3:
          final password = validatorPassword("Password");
          authenticatedUser = (authenticatedUser! as Student).copyWith(password: password);
          break;
        case 4:
          final email = validatorEmail("Email");
          authenticatedUser = (authenticatedUser! as Student).copyWith(email: email);
          break;
        case 5:
          final course = validator("Course");
          authenticatedUser = (authenticatedUser! as Student).copyWith(course: course);
          break;
      }
    } else {
      print("Incorrect value! Please try again");
    }
  } while (!isTerminated);
  
  repository.students[index] = authenticatedUser! as Student;
  return authenticatedUser as Student;
}
