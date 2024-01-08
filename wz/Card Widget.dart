import 'package:flutter/material.dart';
import 'dart:core';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My app', // used by the OS task switcher
      home: Scaffold(
          appBar: AppBar(
            title: Text("GridView Example"),
            backgroundColor: Colors.blue,
          ),
          body: MyApp()),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue,
      elevation: 5,
      shadowColor: Colors.amber,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
          side: BorderSide(color: Colors.black, width: 2)),
      child: Container(
        height: 300,
        width: 300,
      ),
    );
  }
}
