import 'dart:io';

String validatorEmail(String email) {
  do {
    print("                             |---------------------|");
    print("                             |  Enter your email:  |");
    print("                             |---------------------|");
    print("\n");
    print("-----👇");
    email = stdin.readLineSync()!;

    if (!email.endsWith("@gmail.com")) {
      print(
          "              |-----------------------------------------------|");
      print(
          "              |          Must end with => @gmail.com          |");
      print(
          "              |-----------------------------------------------|");
    }
    if(email.length < 16){
      print(
          "              |-----------------------------------------------|");
      print(
          "              |              Gmail is too short !             |");
      print(
          "              |  Gmail should be more than 6 characters !     |");
      print(
          "              |-----------------------------------------------|");
    }
  } while (!(email.endsWith("@gmail.com")) || email.length < 16);

  return email;
}
