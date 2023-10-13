import 'package:registration/models/authenticated_user.dart';

class Admin extends AuthenticatedUser {
  final String id;
  final String? email;
  final String password;

  const Admin({
    required this.id,
    required this.password,
    required String firstName,
    required String lastName,
    required bool isMale,
    this.email,
  }) : super(
          id: id,
          firstName: firstName,
          lastName: lastName,
          isMale: isMale,
        );

  Admin copyWith({
    String? id,
    String? email,
    String? firstName,
    String? lastName,
    bool? isMale,
    String? password,
  }) {
    return Admin(
      id: id ?? this.id,
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      isMale: isMale ?? this.isMale,
      lastName: lastName ?? this.lastName,
      password: password ?? this.password,
    );
  }

  @override
  String toString() {
    return """
------------------------------
| ID       : $id 
| Name     : $firstName
| LastName : $lastName
| Email    : $email
| Gender   : ${isMale ? 'Male':'Female'} 
------------------------------
""";
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Admin && other.id == id && other.email == email;
  }

  @override
  int get hashCode {
    return id.hashCode ^ email.hashCode;
  }

  
}
