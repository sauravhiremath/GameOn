import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class CreatePage extends StatelessWidget {
  static String tag = 'create-page';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TimeSpace',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: 'Nunito',
      ),
      home: CreateNew(),
    );

  }
}

class CreateNew extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('assets/logo.png'),
      );
  }
}