import 'package:flutter/material.dart';
import 'dart:core';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Text Widget Example', // used by the OS task switcher
      theme: ThemeData(
          primarySwatch: Colors.purple,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: Scaffold(
          appBar: AppBar(
            title: Text("Text Widget Example"),
            // backgroundColor: Colors.blue,
          ),
          body: MyApp()),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      color: Colors.grey,
      child: Text.rich(TextSpan(text: 'Text', children: [
        TextSpan(
          text: 'Hi, this is',
          style: TextStyle(color: Colors.amber, fontSize: 18),
        ),
        TextSpan(
          text: 'a test hbkhlkjlkjlj kjhkjgjh,g hmgfhgfjhf jhfmjfj,f',
          style: TextStyle(color: Colors.deepPurple, fontSize: 12),
        )
      ])),
      // child: Text(
      //   'Hi, this is a test hbkhlkjlkjlj kjhkjgjh,g hmgfhgfjhf jhfmjfj,f',
      //   textAlign: TextAlign.center,
      //   // textScaleFactor: 2,
      //   // overflow: TextOverflow.ellipsis,
      //   maxLines: 2,
      //   style: TextStyle(
      //       color: Colors.red,
      //       fontSize: 22,
      //       fontStyle: FontStyle.italic,
      //       fontWeight: FontWeight.w200,
      //       letterSpacing: 2.0,
      //       wordSpacing: 10,
      //       fontFamily: 'TitilliumWeb'),
      // ),
    );
  }
}
