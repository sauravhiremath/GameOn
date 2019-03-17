import 'package:flutter/material.dart';
import 'package:cheat_app/create_page.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatelessWidget {
  static String tag = 'home-page';
  @override
  Widget build(BuildContext context) {

    final createEvent = Container(
      width: MediaQuery.of(context).size.width,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),

        onPressed: () {
          Navigator.of(context).pushNamed(CreatePage.tag);
        },
        padding: EdgeInsets.all(60.0),
        color: Colors.deepPurple[300],
        child: Text('Create Event', style: TextStyle(color: Colors.white, fontSize: 30, fontFamily: 'Roboto')),
      ),
    );

    final joinEvent = Container(
      width: MediaQuery.of(context).size.width,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),

        onPressed: () {
          Navigator.of(context).pushNamed(CreatePage.tag);
        },
        padding: EdgeInsets.all(60.0),
        color: Colors.deepPurple[300],
        child: Text('Join Event', style: TextStyle(color: Colors.white, fontSize: 30, fontFamily: 'Roboto')),
      ),
    );

    final body = Center(
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(28.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.deepPurple,
            Colors.deepPurpleAccent,
          ]),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            joinEvent,
            createEvent,
          ],
        ),
      ),
    );

    return Scaffold(
      body: body,
    );
  }
}