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

class Course {
  //TODO implement as needed
}

//-----------------------------------First Screen Implementation-----------------------------------
class StartQ extends StatefulWidget {
  StartQState createState() => StartQState();
}

class StartQState extends State<StartQ> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GPA Calculator  |  Uom E-Fac'),
      ),
      body: _buildIsMPR(),
      backgroundColor: Color.fromRGBO(3, 48, 22, 1),
    );
  }

  Widget _buildIsMPR() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'Select your stream',
            style: TextStyle(color: Colors.white, fontSize: 28),
          ),
          const SizedBox(height: 70),
          ButtonTheme(
            minWidth: 200.0,
            height: 100.0,
            child: RaisedButton(
              onPressed: _pushToMPR,
              textColor: Colors.white,
              color: Color.fromRGBO(1, 24, 11, 1),
              padding: const EdgeInsets.all(0.0),
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10.0)),
              child: const Text('MPR', style: TextStyle(fontSize: 28)),
            ),
          ),
          const SizedBox(height: 50),
          ButtonTheme(
            minWidth: 200.0,
            height: 100.0,
            child: RaisedButton(
              onPressed: _pushToOther,
              textColor: Colors.white,
              color: Color.fromRGBO(1, 24, 11, 1),
              padding: const EdgeInsets.all(0.0),
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10.0)),
              child: const Text('EM, TM, TLM', style: TextStyle(fontSize: 28)),
            ),
          ),
        ],
      ),
    );
  }

  void _pushToMPR() {
    Navigator.push(
      context,
      new MaterialPageRoute(builder: (context) => new MPRFirstScreen()),
    );
  }

  void _pushToOther() {
    Navigator.push(
      context,
      new MaterialPageRoute(builder: (context) => new OtherFirstScreen()),
    );
  }
}
//-----------------------------------End of First Screen Implementation--------------------------

class LabeledRadio extends StatelessWidget {
  const LabeledRadio({
    this.label,
    this.padding,
    this.groupValue,
    this.value,
    this.onChanged,
  });

  final String label;
  final EdgeInsets padding;
  final bool groupValue;
  final bool value;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (value != groupValue) onChanged(value);
      },
      child: Padding(
        padding: padding,
        child: Row(
          children: <Widget>[
            Radio<bool>(
              groupValue: groupValue,
              value: value,
              onChanged: (bool newValue) {
                onChanged(newValue);
              },
            ),
            Text(label),
          ],
        ),
      ),
    );
  }
}

//-----------------------------------MPR First Screen Implementation-----------------------------
class MPRFirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('MPR'),
      ),
      body: _mprSelect(),
      backgroundColor: Color.fromRGBO(3, 48, 22, 1),
    );
  }

  Widget _mprSelect() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            "Semester you're currently enrolled in",
            style: TextStyle(color: Colors.white, fontSize: 23),
          ),
        ],
      ),
    );
  }
}

//-----------------------------------End of MPR First Screen Implementation------------------------

//-----------------------------------Other First Screen Implementation-----------------------------
class OtherFirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('EM | TM | TLM'),
      ),
      body: _otherSelect(),
    );
  }

  Widget _otherSelect() {
    return null;
  }
}
