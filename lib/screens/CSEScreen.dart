import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class CSEScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Computer Science and Engineering'),
      ),
      body: Container(
        child: Column(children: [_buildSelectSem()]),
      ),
      backgroundColor: Color.fromRGBO(3, 48, 22, 1),
    );
  }

  Widget _buildSelectSem() {
    return ListView.builder(
        itemCount: 8,
        itemBuilder: (context, i) {
          return _buildRow(context);
        });
  }
}

Widget _buildRow(context) {
  return Text('Hello');
}
