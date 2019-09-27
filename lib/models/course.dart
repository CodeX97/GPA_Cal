import 'dart:convert';
import 'dart:ffi';

class Course {
  Course();

  int courseId;
  String courseName;
  int semester;
  Float credit;

  static final columns = [
    'course_id',
    'course_name',
    'semester',
    'credit',
  ];

  Map toMap() {
    Map map = {
      'course_id': courseId,
      'course_name': courseName,
      'semester':semester,
      'credit': credit,
    };

    return map;
  }

  static fromMap(Map map) {
    Course course = new Course();
    course.courseId = map['course_id'];
    course.courseName = map['course_name'];
    course.semester = map['semester'];
    course.credit = map['credit'];

    return course;
  }
}
