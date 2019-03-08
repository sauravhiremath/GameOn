import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() => runApp(new HelloWorldApp());

final dummySnapshot = [
  {"name": "A", "votes": 0},
  {"name": "B", "votes": 0},
  {"name": "C", "votes": 0},
  {"name": "D", "votes": 0},
];

class HelloWorldApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => new MaterialApp(

      title: 'Time2Cheat',
      home: Homepage(),
      theme: new ThemeData(primarySwatch: Colors.deepPurple),
    );
}

class Homepage extends StatefulWidget {
  @override
  State<StatefulWidget> createState(){
    return _HomeState();
  }
}

class _HomeState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cheat XoXo',
          textAlign: TextAlign.center,
          style: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.w300),
          ),
        centerTitle: true,
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.mail),
            title: new Text('Messages'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.person),
            title: new Text('Profile'),
          ),
        ],
      ),
      body: _buildBody(context),
    );
  }
}

Widget _buildBody(BuildContext context) {
  return _buildList(context, dummySnapshot);
}

Widget _buildList(BuildContext context, List<Map> snapshot) {
  return ListView(
    padding: const EdgeInsets.only(top: 20.0),

  );
}