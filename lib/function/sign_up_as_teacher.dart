
import 'package:registration/app.dart';
import 'package:registration/function/select_gender.dart';
import 'package:registration/function/validators/validator.dart';
import 'package:registration/function/validators/validator_password.dart';
import 'package:registration/models/teacher.dart';

Teacher signUpAsTeacher() {
  late bool isMale;
  var id = validator("ID");
  var firstName = validator("Name");
  var lastName = validator("LastName");
  var password = validatorPassword("Password");
  isMale = selectGender();
  var subject = validator("Subject");

  // var  = validator("Fan");

  return teacherRepository.createTeacher(
    isMale: isMale,
    salary: 0,
    subject: subject,
    firstName: firstName,
    id: id,
    lastName: lastName,
    password: password,
  );
}
