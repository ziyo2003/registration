import 'package:registration/app.dart';
import 'package:registration/function/select_gender.dart';
import 'package:registration/function/validators/validator.dart';
import 'package:registration/function/validators/validator_password.dart';
import 'package:registration/models/admin.dart';

Admin signUpAsAdmin() {
  late bool isMale;
  var id = validator("ID");
  var firstName = validator("Name");
  var lastName = validator("LastName");
  var password = validatorPassword("Password");
  isMale = selectGender();


  return adminRepository.createAdmin(
    isMale:isMale,
    firstName:firstName,
    id:id,
    lastName:lastName,
    password:password,
  );
}

