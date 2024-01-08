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

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      children: [
        Container(
          alignment: Alignment.center,
          color: Colors.amber,
          child: Text("Ok!"),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.amber,
          child: Text("Ok!"),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.amber,
          child: Text("Ok!"),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.amber,
          child: Text("Ok!"),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.amber,
          child: Text("Ok!"),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.amber,
          child: Text("Ok!"),
        ),
      ],
    );
  }
}
