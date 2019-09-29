import 'package:flutter/material.dart';
import 'package:gpa_calculator/screens/CSEScreen.dart';
import 'screens/CSEScreen.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GPA Calculator',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(36, 54, 54, 1),
      ),
      home: CSEScreen(),
    );
  }
}

//-----------------------------------First Screen Implementation-----------------------------------
