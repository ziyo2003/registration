
import 'package:registration/function/show_menu.dart';
import 'package:registration/models/authenticated_user.dart';
import 'package:registration/repository/admin.dart';
import 'package:registration/repository/student.dart';
import 'package:registration/repository/teacher.dart';

AuthenticatedUser? authenticatedUser;
late StudentRepository repository;
late TeacherRepository teacherRepository;
late AdminRepository adminRepository;
bool isTerminated = false;
void runApp() {
  repository = StudentRepository();
  teacherRepository = TeacherRepository();
  adminRepository = AdminRepository();
  showMenu();

  // TODO1: Make back work in registeration
  // TODO2: Signin as a teacher
  // TODO3: Print menu for printing teachers and students
}

