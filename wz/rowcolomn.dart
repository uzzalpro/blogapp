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

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("hi"),
        Text("thi"),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("hi-row-"),
            Text("this-row"),
          ],
        ),
        Text("is"),
        Text("row"),
      ],
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
