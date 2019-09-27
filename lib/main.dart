import 'package:flutter/material.dart';
import 'screens/StartQ.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GPA Calculator',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(1, 24, 11, 1),
      ),
      home: StartQ(),
    );
  }
}

//-----------------------------------First Screen Implementation-----------------------------------
