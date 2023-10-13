// TODO 1: Talaba klasini yaratish
// CTRL + .
// CMND + .

import 'package:registration/models/authenticated_user.dart';

class Student extends AuthenticatedUser {
 
  final String password;
  final String? email;
  
  final String course;

  const Student({
    required super.id,
    required super.firstName,
    required super.lastName,
    required this.password,
    required super.isMale,
    required this.course,
    this.email,
  });

  Student copyWith({
    String? firstName,
    String? lastName,
    String? password,
    String? email,
    String? course,
  }) {
    return Student(
      id: id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      password: password ?? this.password,
      isMale: isMale,
      course: course ?? this.course,
      email: email ?? this.email,
    );
  }

  @override
  String toString() {
    return """
------------------------------------
|  ID         : $id                        
|  Name       : $firstName 
|  LastName   : $lastName 
|  Password   : ********
|  Email      : $email 
|  IsMale     : $isMale 
|  Course     : $course
|  Gender     : ${isMale ? 'Male':'Female'}
------------------------------------
""";
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Student &&
      other.id == id &&
      other.firstName == firstName &&
      other.lastName == lastName &&
      other.password == password &&
      other.email == email &&
      other.isMale == isMale &&
      other.course == course;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      firstName.hashCode ^
      lastName.hashCode ^
      password.hashCode ^
      email.hashCode ^
      isMale.hashCode ^
      course.hashCode;
  }
}
