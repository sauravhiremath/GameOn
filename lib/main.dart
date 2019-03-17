import 'package:flutter/material.dart';
import 'login_page.dart';
import 'home_page.dart';
import 'create_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    LoginPage.tag: (context) => LoginPage(),
    HomePage.tag: (context) => HomePage(),
    CreatePage.tag: (context) => CreatePage(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TimeSpace',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'Nunito',
      ),
      home: LoginPage(),
      routes: routes,
    );
  }
}