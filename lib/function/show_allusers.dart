import 'dart:io';

import 'package:registration/app.dart';

void showAllUsers(int role){
  if(role==1 ||  role == 4)
  {
              var teachers = teacherRepository.fetchTeachers();
              print("""
<><><><><><><><><><><><><><><><><>><><><><>
><  All registred teachers count: ${teachers.length}
<><><><><><><><><><><><><><><><><>><><><><>
""");
            for (final teacher in teachers) {
              print(teacher);
            }
  }
  if(role == 2 || role == 4)
  {
            var students = repository.fetchStudents();
              print("""
<><><><><><><><><><><><><><><><><>><><><><>
><  All registred students count: ${students.length}
<><><><><><><><><><><><><><><><><>><><><><>
""");

            for (final student in students) {
               print(student);   
            }
   }
   if(role == 3 || role == 4)
   {
          var admins = adminRepository.fetchAdmins();
print("""
<><><><><><><><><><><><><><><><><>><><><><>
><  All registred admins count: ${admins.length}
<><><><><><><><><><><><><><><><><>><><><><>
""");
            for (final admin in admins) {
              print(admin);
            }
            stdin.readLineSync();
  }
}
