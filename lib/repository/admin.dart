import '../models/admin.dart';

/// Interface
abstract class AdminRepository {
  List<Admin> admins = [];

  factory AdminRepository() => AdminRepositoryImpl();

  Admin createAdmin({
    required String id,
    required String firstName,
    required String lastName,
    required String password,
    required bool isMale,
  });

  bool deleteAdmin(String id);

  bool updateAdmin(String id, Admin admin);

  Admin fetchAdmin(String id, String password);

  List<Admin> fetchAdmins();
}

class AdminRepositoryImpl implements AdminRepository {
  @override
  List<Admin> admins = [
    Admin(id: "7", password: "QWqw1111", 
    firstName: "Ali", lastName: "Nabiev", isMale: true),
  
    Admin(id: "8", password: "QWqw1111", 
    firstName: "Nigora", lastName: "Nabieva", isMale: false),
    
    Admin(id: "9", password: "QWqw1111", 
    firstName: "Zafar", lastName: "Jasurov", isMale: true)
  ];

  @override
  Admin createAdmin({
    required String id,
    required String firstName,
    required String lastName,
    required String password,
    required bool isMale,
  }) {
    var newAdmin = Admin(
      id: id,
      firstName: firstName,
      lastName: lastName,
      password: password,
      isMale: isMale,
    );

    admins.add(newAdmin);

    return newAdmin;
  }

  @override
  bool deleteAdmin(String id) {
    late bool isDeleted;

    try {
      admins.removeWhere((element) => element.id == id);
      isDeleted = true;
    } catch (e) {
      isDeleted = false;
    }

    return isDeleted;
  }

  @override
  Admin fetchAdmin(String id, String password) {
    var searchedAdmin = admins.firstWhere(
        (element) => element.id == id && element.password == password);
    return searchedAdmin;
  }

  @override
  List<Admin> fetchAdmins() {
    return admins;
  }

  @override
  bool updateAdmin(String id, Admin admin) {
    // TODO: implement updateTeacher
    throw UnimplementedError();
  }
  

}
