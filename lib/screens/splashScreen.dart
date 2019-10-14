import 'dart:async';

import 'package:gpa_calculator/classes/colors.dart';
import 'package:gpa_calculator/screens/home.dart';

import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new SplashState();
}

class SplashState extends State<Splash> {
  void homeScreen() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => new HomePage()));
  }

  @override
  void initState() {
    super.initState();

    Timer(Duration(milliseconds: 2000), () {
      homeScreen();
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(size.width * 0.1, size.height * 0.4,
            size.width * 0.1, size.height * 0.4),
        decoration: BoxDecoration(color: AppColor.colors[0].color),
        child: Center(
          child: Column(
            children: [
              Text(
                'GPA Calculator',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: size.height * 0.04,
                  fontFamily: 'Handlee',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
