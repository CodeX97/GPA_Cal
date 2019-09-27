import 'dart:ffi';
import 'dart:io';
import 'package:gpa_calculator/models/course.dart';
import 'package:gpa_calculator/models/department.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

// database table and column names
final String tableCourses = 'courses';
final String columnId = 'id';
final String columnCourse = 'course';
final String columnCredit = 'credit';
final String columnDepartment = 'department';
final String columnSemester = 'semester';

class DatabaseClient {
  Database _db;

  Future create() async {
    Directory path = await getApplicationDocumentsDirectory();
    String dbPath = join(path.path, 'CourseDatabse.db');

    _db = await openDatabase(dbPath, version: 1, onCreate: this._create);
  }

  Future _create(Database db, int version) async {
    await db.execute("""
            CREATE TABLE departments (
              id INTEGER PRIMARY KEY NOT NULL,  
              department TEXT NOT NULL
            )""");
    await db.execute("""
            CREATE TABLE courses (
              course_id INTEGER PRIMARY KEY NOT NULL,
              course_name TEXT NOT NULL UNIQUE,
              semester INTEGER NOT NULL,
              credit REAL NOT NULL,
              FOREIGN KEY (dept_id) REFERENCES departments (id) NOT NULL
            )""");
  }

  Future<List<Course>> fetchCourses(int deptId, int sem) async {
    List<Map> results = await _db.query("courses",
        columns: Course.columns,
        where: "semester = ? && dept_id = ?",
        whereArgs: [sem, deptId]);
    List<Course> courses = new List();
    results.forEach((result) {
      Course course = Course.fromMap(result);
      courses.add(course);
    });
    return courses;
  }
}
