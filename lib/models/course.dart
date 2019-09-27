import 'dart:convert';
import 'dart:ffi';

class Course {
  Course();

  int courseId;
  String courseName;
  int semester;
  Float credit;
  String department;

  static final columns = [
    'course_id',
    'course_name',
    'semester',
    'credit',
    'dept_id'
  ];

  Map toMap() {
    Map map = {
      'course_id': courseId,
      'course_name': courseName,
      'semester':semester,
      'credit': credit,
      'dept_id': department,
    };

    return map;
  }

  static fromMap(Map map) {
    Course course = new Course();
    course.courseId = map['course_id'];
    course.courseName = map['course_name'];
    course.semester = map['semester'];
    course.credit = map['credit'];
    course.department = map['dept_id'];

    return course;
  }
}
