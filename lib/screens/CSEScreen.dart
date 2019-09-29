import 'dart:collection';
import 'dart:developer';
import 'dart:ffi';

import 'package:flutter/material.dart';

import 'Sem1Screen.dart';

class CSEScreen extends StatefulWidget {
  CSEScreenState createState() => CSEScreenState();
}

class CSEScreenState extends State<CSEScreen> {
  int _count = 1;
  List<Widget> _semesterCards = [Divider()];
  List<Widget> _hideButtons = [];
  ScrollController _scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _buildCard(),
        label: Text('Add Semester',
            textAlign: TextAlign.center, style: TextStyle(fontSize: 18)),
        splashColor: Color.fromRGBO(21, 99, 94, 1),
        icon: Icon(IconData(57670, fontFamily: 'MaterialIcons')),
        backgroundColor: Color.fromRGBO(36, 54, 54, 1),
      ),
      appBar: new AppBar(
        title: new Text('GPA Calculator'),
      ),
      body: Container(
          padding: EdgeInsets.all(20.0),
          child: ListView(
            controller: _scrollController,
            reverse: false,
            shrinkWrap: true,
            children: UnmodifiableListView(_semesterCards),
          )),
      backgroundColor: Color.fromRGBO(21, 99, 94, 1),
    );
  }

  void _buildCard() {
    //double screenHeight = MediaQuery.of(context).size.height;
    if (_count > 8) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: Color.fromRGBO(36, 54, 54, 1),
              content: Text(
                "Can't add more semesters.",
                style: TextStyle(color: Colors.white),
              ),
              actions: <Widget>[
                new FlatButton(
                  child: Text(
                    'OK',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    } else {
      _hideButtons = List.from(_hideButtons)..add(_semesterCards.last);
      _semesterCards.removeLast();
      _semesterCards = List.from(_semesterCards)
        ..add(SizedBox(
          height: 210,
          child: Card(
            color: Color.fromRGBO(36, 54, 54, 1),
            child: Column(
              children: [
                ListTile(
                  title: Text('Semester $_count',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          fontWeight: FontWeight.w500, color: Colors.white)),
                  leading: Icon(
                    const IconData(59404, fontFamily: 'MaterialIcons'),
                    color: Colors.white,
                  ),
                ),
                Divider(
                  color: Colors.white,
                ),
                ListTile(
                  title: Text('GPA = ',
                      style: TextStyle(
                          fontWeight: FontWeight.w300, color: Colors.white)),
                ),
                ListTile(
                  title: Center(
                    child: RaisedButton(
                      onPressed: () => navigateToRoute(_count),
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(5.0)),
                      textColor: Colors.white,
                      color: Color.fromRGBO(21, 99, 94, 1),
                      child: Text('Add Data'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
      _semesterCards = List.from(_semesterCards)
        ..add(RaisedButton(
            onPressed: () {
              _semesterCards.removeLast();
              _semesterCards.removeAt(-2);
              _semesterCards =
                  List.from((_semesterCards)..add(_hideButtons.last));
              setState(() => --_count);
            },
            child: Text('Remove Semester')));
      _scrollController.animateTo(
        1000,
        curve: Curves.easeIn,
        duration: const Duration(milliseconds: 800),
      );
      setState(() => ++_count);
    }
  }

  void navigateToRoute(int sem) {
    switch (sem) {
      case 1:
        {
          Navigator.push(context,
              new MaterialPageRoute(builder: (context) => new Sem1Screen()));
          break;
        }
      case 2:
        {
          // Navigator.push(
          //   context,
          //   new MaterialPageRoute(builder: (context)=> new CEScreen())
          // );
          break;
        }
      case 3:
        {
          // Navigator.push(context,
          // route)
          break;
        }
      case 4:
        {
          // Navigator.push(
          //   context,
          //   new MaterialPageRoute(builder: (context)=> new EREScreen())
          // );
          break;
        }
      case 5:
        {
          // Navigator.push(
          //   context,
          //   new MaterialPageRoute(builder: (context)=> new EEScreen())
          // );
          break;
        }
      case 6:
        {
          // Navigator.push(
          //   context,
          //   new MaterialPageRoute(builder: (context)=> new ENTCScreen())
          // );
          break;
        }
      case 7:
        {
          // Navigator.push(
          //   context,
          //   new MaterialPageRoute(builder: (context)=> new MSEScreen())
          // );
          break;
        }
      case 8:
        {
          Navigator.push(context,
              new MaterialPageRoute(builder: (context) => new Sem1Screen()));
          break;
        }
    }
  }
}
