import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:gpa_calculator/classes/colors.dart';
import 'package:gpa_calculator/models/readJson.dart';

//Added cupertino ios routing animation through creating a routing class
class CSEPageRoute extends CupertinoPageRoute {
  CSEPageRoute() : super(builder: (BuildContext context) => new CSEScreen());

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return new FadeTransition(opacity: animation, child: new CSEScreen());
  }
}

class CSEScreen extends StatefulWidget {
  CSEScreenState createState() => CSEScreenState();
}

class CSEScreenState extends State<CSEScreen> {
  int sem = 1;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
              child: Icon(Icons.add_circle_outline),
              heroTag: null,
              onPressed: () {
                if (sem < 8) {
                  setState(() {
                    sem++;
                  });
                }
              }),
          SizedBox(
            width: size.width * 0.05,
          ),
          FloatingActionButton(
            heroTag: null,
            child: Icon(Icons.remove_circle_outline),
            onPressed: () {
              if (sem > 1) {
                setState(() {
                  sem--;
                });
              }
            },
          ),
        ],
      ),
      body: Container(
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
        child: FutureBuilder(
          future: loadCSE(),
          builder: (context, cseSnap) {
            switch (cseSnap.connectionState) {
              case ConnectionState.none:
              case ConnectionState.active:
              case ConnectionState.waiting:
              case ConnectionState.done:
                if (cseSnap.hasError) return Text('Error: ${cseSnap.error}');
                return ListView.builder(
                  itemCount: sem,
                  itemBuilder: (context, position) {
                    return buildSem(
                      context,
                      size,
                      cseSnap.data.semesters[position],
                    ); //builds sem per item in the list fromjson
                  },
                );
            }
            return null; // unreachable
          },
        ),
      ),
    );
  }

  Widget buildSem(context, size, sem) {
    String dropdownValue ='One';
    return Padding(
      padding: EdgeInsets.fromLTRB(size.width * 0.08, size.height * 0.02,
          size.width * 0.08, size.height * 0.02),
      child: RaisedButton(
        color: Colors.white,
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  content: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: DropdownButton<String>(
                            value: dropdownValue,
                            icon: Icon(Icons.arrow_downward),
                            iconSize: 24,
                            elevation: 16,
                            style: TextStyle(color: AppColor.colors[0].color),
                            underline: Container(
                              height: 2,
                              color: AppColor.colors[0].color,
                            ),
                            onChanged: (String newValue) {
                              setState(() {
                                dropdownValue = newValue;
                              });
                            },
                            items: <String>['One', 'Two', 'Free', 'Four']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: TextFormField(),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RaisedButton(
                            child: Text("Submit"),
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                _formKey.currentState.save();
                              }
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                );
              });
        },
        child: Text(
          'Semester ${sem.sem}',
          style: TextStyle(
            color: AppColor.colors[1].color,
            fontSize: size.height * 0.02,
          ),
        ),
      ),
    );
  }

  Widget buildSemDetails(sem, i) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.fromLTRB(
        size.width * 0.0,
        size.height * 0.02,
        size.width * 0.0,
        size.height * 0.02,
      ),
      child: Column(
        children: <Widget>[Text('Module Code: ${sem.modules[i].moduleId}')],
      ),
    );
  }
}
