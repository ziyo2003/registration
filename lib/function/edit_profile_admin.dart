import 'package:registration/app.dart';
import 'package:registration/consts/contants.dart';
import 'package:registration/function/clear_terminal.dart';
import 'package:registration/function/validators/validator.dart';
import 'package:registration/function/validators/validator_email.dart';
import 'package:registration/function/validators/validator_password.dart';
import 'package:registration/models/admin.dart';

Admin editProfileAdmin() {
  bool isTerminated = false;
  final int index = adminRepository.admins.indexOf(authenticatedUser! as Admin);
  do {
    clearTerminal();
    print(AppConstans.adminMyEditProfileText);

    var input = validator("Command");

    final int task = int.tryParse(input) ?? -1;

    if (task >= 0 || task <=5) {
      switch (task) {
        case 0:
          isTerminated = true;
          break;
        case 1:
          final firstName = validator("Name");
          authenticatedUser = (authenticatedUser! as Admin).copyWith(firstName: firstName);
          break;
        case 2:
          final lastName = validator("LastName");
          authenticatedUser = (authenticatedUser! as Admin).copyWith(lastName: lastName);
          break;
        case 3:
          final password = validatorPassword("Password");
          authenticatedUser = (authenticatedUser! as Admin).copyWith(password: password);
          break;
        case 4:
          final email = validatorEmail("Email");
          authenticatedUser = (authenticatedUser! as Admin).copyWith(email: email);
          break;
      }
    } else {
      print("Incorrect value! Please try again");
    }
  } while (!isTerminated);
  
  adminRepository.admins[index] = authenticatedUser! as Admin;
  return authenticatedUser as Admin;
}