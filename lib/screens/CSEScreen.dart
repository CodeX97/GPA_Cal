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
      body: _buildSelectSem(),
      backgroundColor: Color.fromRGBO(3, 48, 22, 1),
    );
  }

  Widget _buildSelectSem() {
    return null;
  }
}
