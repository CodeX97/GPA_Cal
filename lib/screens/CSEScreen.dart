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
  final GlobalKey<ScaffoldState> _key = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size; //Get current device size
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
              child: Icon(Icons.add_circle_outline),
              onPressed: () {
                if (sem < 8) {
                  setState(() {
                    sem++;
                  });
                } else {
                  _key.currentState.showSnackBar(
                    SnackBar(
                      content: Text("Can't add more semesters !"),
                    ),
                  );
                }
              }),
          SizedBox(
            width: size.width * 0.05,
          ),
          FloatingActionButton(
            child: Icon(Icons.remove_circle_outline),
            onPressed: () {
              setState(() {
                sem--;
              });
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
                return Padding(
                  padding: EdgeInsets.fromLTRB(
                    size.width * 0.35,
                    size.height * 0.425,
                    size.width * 0.35,
                    size.height * 0.425,
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    height: size.height * 0.05,
                    width: size.width * 0.3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: AppColor.colors[1].color,
                      ),
                      color: Colors.white,
                    ),
                    child: Text('Error Occured !'),
                  ),
                );
              case ConnectionState.active:
              case ConnectionState.waiting:
                return Padding(
                  padding: EdgeInsets.fromLTRB(
                    size.width * 0.35,
                    size.height * 0.425,
                    size.width * 0.35,
                    size.height * 0.425,
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    height: size.height * 0.05,
                    width: size.width * 0.3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: AppColor.colors[1].color,
                        //color: Color.fromRGBO(36, 209, 99, 0.9),
                      ),
                      color: Colors.white,
                    ),
                    child: Text('Loading ...'),
                  ),
                );
              case ConnectionState.done:
                if (cseSnap.hasError) return Text('Error: ${cseSnap.error}');
                return ListView.builder(
                  itemCount: sem,
                  itemBuilder: (context, position) {
                    return buildSem(
                      context,
                      size,
                      cseSnap.data.semesters[position],
                    ); //builds sem per item in the list from db
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
    return Padding(
      padding: EdgeInsets.fromLTRB(size.width * 0.08, size.height * 0.02,
          size.width * 0.08, size.height * 0.02),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: AppColor.colors[1].color,
          ),
          color: Colors.white,
        ),
        child: ExpansionTile(
          title: Text(
            'Semester ${sem.sem}',
            style: TextStyle(
              color: AppColor.colors[1].color,
              fontSize: size.height * 0.02,
            ),
          ),
          children: [],
        ),
      ),
    );
  }
}
