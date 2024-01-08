import 'package:flutter/material.dart';
import 'dart:core';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My app', // used by the OS task switcher
      home: Scaffold(
          appBar: AppBar(title: Text("Row and column")), body: MyApp()),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var stack = Stack(
        // mainAxisAlignment: MainAxisAlignment.center,--> haven't this is in Stack
        // alignment: Alignment.center,

        // alignment: Alignment.topCenter,
        // overflow: Overflow.visible,
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 200,
            height: 200,
            color: Colors.red,
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              width: 100,
              height: 100,
              color: Colors.blue,
            ),
          ),
          Positioned(
              bottom: -45,
              right: 4,
              height: 90,
              child: Container(
                width: 50,
                height: 50,
                color: Colors.green,
              ))
        ]);
    return Center(
      child: stack,
    );
  }
}
