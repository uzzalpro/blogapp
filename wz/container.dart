import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My app', // used by the OS task switcher
      home: Scaffold(body: MyApp()),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
      width: 300.0,
      child: Text("Hello Container"),
      alignment: Alignment.center,
      margin: EdgeInsets.all(16.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 224, 72, 72),
          shape: BoxShape.rectangle,
          border: Border.all(color: Colors.black12, width: 2)),
      transform: Matrix4.rotationZ(.5),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String name;

  CustomButton(this.name);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('Press OnTap');
      },
      child: Container(
        height: 40,
        width: 100,
        decoration:
            BoxDecoration(shape: BoxShape.rectangle, color: Colors.blue),
        child: Center(child: Text(name)),
      ),
    );
  }
}
