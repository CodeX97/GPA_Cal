import 'dart:ffi';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:gpa_calculator/models/course.dart';
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
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String dbPath = join(documentsDirectory.path, "courses.db");
    ByteData data = await rootBundle.load(join("assets", "CourseDatabase.db"));
    List<int> bytes =
        data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    await new File(dbPath).writeAsBytes(bytes);
    _db = await openDatabase(dbPath, version: 1);
  }

  Future<List<Course>> fetchMPR() async {
    List<Map> results = await _db.query("MPRSemOne", columns: Course.columns);
    List<Course> courses = new List();
    results.forEach((result) {
      Course course = Course.fromMap(result);
      courses.add(course);
    });
    return courses;
  }

  Future<List<Course>> fetchCSECourses(String stream, int sem) async {
    List<Course> courses = new List();

    List<Map> results = await _db.query("cseCourses",
        columns: Course.columns,
        where: "semester = ? AND stream = ?",
        whereArgs: [sem, stream]);

    results.forEach((result) {
      Course course = Course.fromMap(result);
      courses.add(course);
    });

    return courses;
  }
}
