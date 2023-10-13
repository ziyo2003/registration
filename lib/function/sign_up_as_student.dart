
import 'package:registration/app.dart';
import 'package:registration/function/select_gender.dart';
import 'package:registration/function/validators/validator.dart';
import 'package:registration/function/validators/validator_password.dart';
import 'package:registration/models/student.dart';

Student signUpAsStudent() {
  late bool isMale;
  var id = validator("ID");
  var firstName = validator("Name");
  var lastName = validator("LastName");
  var password = validatorPassword("Password");
  isMale = selectGender();
  var course = validator("Course");

  return repository.createStudent(
    isMale: isMale,
    course: course,
    firstName: firstName,
    id: id,
    lastName: lastName,
    password: password,
  );
}


