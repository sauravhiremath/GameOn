import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class IssuesPage extends StatefulWidget {
  static String tag = 'issue-page';
  @override
  _IssuesPageState createState() => new _IssuesPageState();
}

class _IssuesPageState extends State<IssuesPage> {
  TextEditingController nameController;
  String username;
  String event;

  Future<Null> getSharedData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      username = pref.getString('name');
      event = pref.getString('event');
    });
  }

  void initState() {
    super.initState();
    username = "";
    event = "";
    getSharedData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: event,
        home: IssuesList(title: event, username: username),
        theme: ThemeData(
            primarySwatch: Colors.lightBlue, fontFamily: 'Open Sans'));
  }
}

class IssuesList extends StatelessWidget {
  final String title;
  final String username;

  IssuesList({Key key, this.title, this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text('My Page!')),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the Drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      username,
                      style: TextStyle(fontSize: 30),
                    ),
                    CircleAvatar(
                      radius: 50.0,
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage('assets/logo.png'),
                    )
                  ],
                )
              ],
            )),
            ListTile(
              leading: new Icon(Icons.group),
              title: Text('My Issues'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: new Icon(Icons.chat_bubble),
              title: Text('Chatroom'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: new Icon(Icons.archive),
              title: Text('Archive'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
