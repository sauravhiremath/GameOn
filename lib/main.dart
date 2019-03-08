import 'package:flutter/material.dart';

void main() => runApp(new HelloWorldApp());

class HelloWorldApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => new MaterialApp(

      title: 'Time2Cheat',
      home: Homepage(),
      theme: ThemeData.light(),
    );
}

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Cheat not always bad, eh ?",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w200,
            fontSize: 30,
            fontFamily: "Segio UI",
          ),
        ),
      ),
    );
  }
}