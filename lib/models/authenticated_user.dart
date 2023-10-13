import 'package:registration/models/person.dart';

class AuthenticatedUser extends Person {
  final String id;
  const AuthenticatedUser({
    required this.id,
    required super.firstName,
    required super.lastName,
    required super.isMale,
  });
}
