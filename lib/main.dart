import 'package:flutter/material.dart';

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
class StartQ extends StatefulWidget {
  StartQState createState() => StartQState();
}

class StartQState extends State<StartQ> {
  final _departments = <String>[
    'Chemical and Process Engineering',
    'Civil Engineering',
    'Computer Science and Engineering',
    'Earth Resources and Engineering',
    'Electrical Engineering',
    'Electronic and Telecommunication Engineering',
    'Material Science and Engineering',
    'Mechanical Engineering',
    'Textile and Clothing Technology',
    'Transport and Logistics Management'
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GPA Calculator  |  Uom E-Fac'),
      ),
      body: _buildSelectDept(),
      backgroundColor: Color.fromRGBO(3, 48, 22, 1),
    );
  }

  Widget _buildSelectDept() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: (_departments.length * 2) + 1,
        itemBuilder: (context, i) {
          if (i == 0)
            return Padding(
                padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 40.0),
                child: Text(
                  'Select Your Department',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ));
          if (i.isOdd) return Divider();
          final index = i ~/ 2;
          return _buildRow(_departments[index - 1]);
        });
  }

  Widget _buildRow(department) {
    return Padding(
        padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 15.0),
        child: ButtonTheme(
          minWidth: 350.0,
          height: 50.0,
          child: RaisedButton(
            onPressed: () => navigateToRoute(department),
            textColor: Colors.white,
            color: Color.fromRGBO(1, 24, 11, 1),
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10.0)),
            child: Text(department,
                textAlign: TextAlign.center, style: TextStyle(fontSize: 18)),
          ),
        ));
  }

  void navigateToRoute(String department) {
    switch(department) {
      case 'Chemical and Process Engineering': {
        break;
      }
      case 'Civil Engineering':{
        break;
      }
      case 'Computer Science and Engineering':{
        break;
      }
      case 'Earth Resources and Engineering':{
        break;
      }
      case 'Electrical Engineering':{
        break;
      }
      case 'Electronic and Telecommunication Engineering':{
        break;
      }
      case 'Material Science and Engineering':{
        break;
      }
      case 'Mechanical Engineering':{
        break;
      }
      case 'Textile and Clothing Technology':{
        break;
      }
      case 'Transport and Logistics Management':{
        break;
      }
    }
  }
}