import 'dart:ffi';

class Department {
  Department();

  int id;
  String department;

  static final columns = ['id', 'department'];

  Map toMap() {
    Map map = {
      'id': id,
      'department': department,
    };

    return map;
  }

  static fromMap(Map map) {
    Department department = new Department();
    department.id = map['id'];
    department.department = map['department'];

    return department;
  }
}
