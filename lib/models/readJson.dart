import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:gpa_calculator/classes/course.dart';

Future<String> _loadCSECourseAsset() async {
  return await rootBundle.loadString('assets/json/courses_cse.json');
}

Future<CSE> loadCSE() async {
  String jsonString = await _loadCSECourseAsset();
  final jsonResponse = await json.decode(jsonString);
  CSE cse = new CSE.fromJson(jsonResponse);
  return cse;
}
