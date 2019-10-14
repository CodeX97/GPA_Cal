import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gpa_calculator/classes/colors.dart';
import 'package:gpa_calculator/screens/CSEScreen.dart';
import 'package:gpa_calculator/screens/splashScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'GPA Calculator',
      theme: ThemeData(
        fontFamily: 'Comfortaa',
        primaryColor: AppColor.colors[0].color,
      ),
      home: Splash(),
      routes: {},
    );
  }
}
