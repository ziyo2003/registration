import '../models/student.dart';


abstract class StudentRepository {
  List<Student> students = [];

  factory StudentRepository() => StudentRepositoryImpl();

  Student createStudent({
    required String id,
    required String firstName,
    required String lastName,
    required String password,
    required bool isMale,
    required String course,
  });

  bool deleteStudent(String id);

  bool updateStudent(String id, Student student);

  Student fetchStudent(String id, String password);

  List<Student> fetchStudents();
}

class StudentRepositoryImpl implements StudentRepository {
  @override
  List<Student> students = [
  Student(id: '4', course: "Kimyo", password: "QWqw1111",
   firstName: "Dilbek", lastName: "Naimov", isMale: true),

  Student(id: '5', course: "Fizika", password: "QWqw1111",
   firstName: "Nargiza", lastName: "Amirova", isMale: false),

  Student(id: '6', course: "Algebra", password: "QWqw1111", 
  firstName: "Toshmat", lastName: "Saitov", isMale: true)
  ];
  
  @override
  Student createStudent({
    required String id,
    required String firstName,
    required String lastName,
    required String password,
    required bool isMale,
    required String course,
  }) {
    var newStudent = Student(
      id: id,
      firstName: firstName,
      lastName: lastName,
      password: password,
      isMale: isMale,
      course: course,
    );

    students.add(newStudent);

    return newStudent;
  }

  @override
  bool deleteStudent(String id) {
    late bool isDeleted;

    try {
      students.removeWhere((element) => element.id == id);
      isDeleted = true;
    } catch (e) {
      isDeleted = false;
    }

    return isDeleted;
  }

  @override
  Student fetchStudent(String id, String password) {
    var searchedStudent = students.firstWhere(
        (element) => element.id == id && element.password == password);
    return searchedStudent;
  }

  @override
  List<Student> fetchStudents() {
    return students;
  }

  @override
  bool updateStudent(String id, Student student) {
    // TODO: implement updateStudent
    throw UnimplementedError();
  }
}
