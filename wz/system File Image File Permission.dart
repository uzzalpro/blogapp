import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:core';

import 'package:permission_handler/permission_handler.dart';

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

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String filePath = "";

  Future<void> checkPermission() async {
    if (await Permission.storage.request().isGranted) {
      setState(() {
        filePath = '/storage/emulated/0/Download/IMG-20230224-WA0008.jpg';
      });
    } else {
      await Permission.storage.request();
    }
  }

  @override
  Widget build(BuildContext context) {
    checkPermission();
    return Container(
      width: 300,
      height: 300,
      color: Colors.grey,
      child: Image.file(File(filePath)),
      // child: Image.asset('assets/images/cat.gif')
      // Image.network(
      //     'https://www.purina.co.uk/sites/default/files/styles/square_medium_440x440/public/2022-06/Abyssinian.2_0.jpg?h=da189af4&itok=yuauKvul'),
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
