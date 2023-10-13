
import 'package:registration/app.dart';
import 'package:registration/consts/contants.dart';
import 'package:registration/function/clear_terminal.dart';
import 'package:registration/function/validators/validator.dart';
import 'package:registration/function/validators/validatorSalary.dart';
import 'package:registration/function/validators/validator_email.dart';
import 'package:registration/function/validators/validator_password.dart';
import 'package:registration/models/teacher.dart';

Teacher editProfileTeacher() {
  bool isTerminated = false;
  final int index = teacherRepository.teachers.indexOf(authenticatedUser! as Teacher);
  do {
    clearTerminal();
    print(AppConstans.editProfileTeacherText);

    var input = validator("Command");

    final int task = int.tryParse(input) ?? -1;

    if (task >= 0 || task < 6) {
      switch (task) {
        case 0:
          isTerminated = true;
          break;
        case 1:
          final firstName = validator("Name");
          authenticatedUser = (authenticatedUser! as Teacher).copyWith(firstName: firstName);
          break;
        case 2:
          final lastName = validator("LastName");
          authenticatedUser = (authenticatedUser! as Teacher).copyWith(lastName: lastName);
          break;
        case 3:
          final password = validatorPassword("Password");
          authenticatedUser = (authenticatedUser! as Teacher).copyWith(password: password);
          break;
        case 4:
          final email = validatorEmail("Email");
          authenticatedUser = (authenticatedUser! as Teacher).copyWith(email: email);
          break;
        case 5:
          final subject = validator("Subject");
          authenticatedUser = (authenticatedUser! as Teacher).copyWith(subject: subject);
        case 6:
          final salary = validatorSalary("Salary");
          authenticatedUser = (authenticatedUser! as Teacher).copyWith(salary: salary);
      }
    } else {
      print("Incorrect value! Please try again");
    }
  } while (!isTerminated);
  
  teacherRepository.teachers[index] = authenticatedUser! as Teacher;
  return authenticatedUser as Teacher;
}
