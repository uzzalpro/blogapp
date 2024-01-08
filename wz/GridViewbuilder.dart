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
  List<int> list = <int>[];
  @override
  void initState() {
    for (int i = 0; i <= 50; i++) {
      list.add(i);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: list.length,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemBuilder: (BuildContext ctx, int index) {
        return Padding(
          padding: const EdgeInsets.all(3.0),
          child: Container(
            alignment: Alignment.center,
            color: Colors.amber,
            child: Text('item no ${list[index]}'),
          ),
        );
      },
    );
    // return GridView.count(
    //   crossAxisCount: 3,
    //   mainAxisSpacing: 10,
    //   crossAxisSpacing: 10,
    //   children: [
    //     Container(
    //       alignment: Alignment.center,
    //       color: Colors.amber,
    //       child: Text("Ok!"),
    //     ),
    //     Container(
    //       alignment: Alignment.center,
    //       color: Colors.amber,
    //       child: Text("Ok!"),
    //     ),
    //     Container(
    //       alignment: Alignment.center,
    //       color: Colors.amber,
    //       child: Text("Ok!"),
    //     ),
    //     Container(
    //       alignment: Alignment.center,
    //       color: Colors.amber,
    //       child: Text("Ok!"),
    //     ),
    //     Container(
    //       alignment: Alignment.center,
    //       color: Colors.amber,
    //       child: Text("Ok!"),
    //     ),
    //     Container(
    //       alignment: Alignment.center,
    //       color: Colors.amber,
    //       child: Text("Ok!"),
    //     ),
    //   ],
    // );
  }
}
