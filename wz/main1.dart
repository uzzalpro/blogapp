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
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        CustomButton("Create"),
        SizedBox(
          height: 10,
        ),
        CustomButton("Delete"),
        SizedBox(
          height: 10,
        ),
        CustomButton("Update"),
        SizedBox(
          height: 10,
        ),
        CustomButton("Online"),
      ]),
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
