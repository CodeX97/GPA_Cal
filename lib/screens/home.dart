import 'package:flutter/material.dart';
import 'package:gpa_calculator/classes/colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gpa_calculator/screens/CSEScreen.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('GPA Calculator'),
      ),
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: [0.1, 0.5, 0.7, 0.9],
            colors: [
              AppColor.colors[1].color,
              AppColor.colors[3].color,
              AppColor.colors[3].color,
              AppColor.colors[3].color,
            ],
          ),
        ),
        child: Container(
          padding: EdgeInsets.fromLTRB(
            size.width * 0.02,
            size.height * 0.02,
            size.width * 0.02,
            size.height * 0.05,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Card(
                    color: AppColor.colors[0].color,
                    child: FlatButton(
                      padding: EdgeInsets.fromLTRB(
                          size.width * 0.14,
                          size.height * 0.05,
                          size.width * 0.14,
                          size.height * 0.05),
                      onPressed: () {
                        // Navigator.of(context).push(CSEPageRoute());
                        Navigator.pushNamed(context, '/cse');
                      },
                      child: Column(
                        children: <Widget>[
                          Icon(
                            FontAwesomeIcons.laptopCode,
                            size: 40,
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          Text(
                            'CSE',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: size.height * 0.030,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Card(
                    color: AppColor.colors[0].color,
                    child: FlatButton(
                      padding: EdgeInsets.fromLTRB(
                          size.width * 0.15,
                          size.height * 0.05,
                          size.width * 0.15,
                          size.height * 0.05),
                      onPressed: () {
                        Navigator.pushNamed(context, '/ice');
                      },
                      child: Column(
                        children: <Widget>[
                          Icon(
                            FontAwesomeIcons.microchip,
                            size: 40,
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          Text(
                            'ICE',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: size.height * 0.03,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
