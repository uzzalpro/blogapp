import 'package:flutter/material.dart';

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

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: Text('item 1'),
          leading: Container(
            height: 50,
            width: 50,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.yellow),
          ),
          trailing: Icon(Icons.arrow_forward),
        ),
        ListTile(
          title: Text('item 2'),
          leading: Container(
            height: 50,
            width: 50,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.green),
          ),
          trailing: Icon(Icons.arrow_forward),
        ),
        ListTile(
          title: Text('item 3'),
          leading: Container(
            height: 50,
            width: 50,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.pink),
          ),
          trailing: Icon(Icons.arrow_forward),
        ),
      ],
    );
  }
}
