import 'package:registration/function/validators/validator.dart';

bool selectGender() {
  late bool isMale;

  bool isTerminated = true;
  do {
    isTerminated = true;
    print("Select your fender: m (male) / f (female):");
    var input = validator("Gender");
    try {
      switch (input) {
        case "m":
          isMale = true;
          break;
        case "f":
          isMale = false;
          break;
        default:
          throw Exception("Selected incorrect Gender!");
      }
    } catch (error) {
      isTerminated = false;
    }
  } while (!isTerminated);

  return isMale;
}
