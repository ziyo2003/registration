import 'dart:io';

String validatorPassword(String password) {
  RegExp lowercaseRegex = RegExp(r'[a-z]');
  RegExp uppercaseRegex = RegExp(r'[A-Z]');
  RegExp digitRegex = RegExp(r'[0-9]');

print(""" 
|----------------------|
| Enter your password: |
|----------------------|
""");
  String? password;
  bool isPasswordValid = false;

  while (!isPasswordValid) {
    password = stdin.readLineSync()!;
    
    if (password.length >= 8 &&
        lowercaseRegex.hasMatch(password) &&
        uppercaseRegex.hasMatch(password) &&
        digitRegex.hasMatch(password)) {
      isPasswordValid = true;
    } else {
      print("""
                     Invalid password! Please try again.
                   -----------------------------------------
                   |  Incorrect  password!                 |
                   -----------------------------------------
                   | The password must contain             |  
                   | uppercase letters, lowercase letters, |
                   | and numbers, and the password         |
                   | must be at least 8 characters long    |
                   -----------------------------------------\n""");
    }
  }

  return password!;
}