import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:login/issues.dart';

class HomePage extends StatelessWidget {
  static String tag = 'home-page';
  final String username, passkey;
  final namecontroller = TextEditingController();
  HomePage(this.username, this.passkey);

  Future<String> _asyncInputDialog(BuildContext context, String action) async {
  return showDialog<String>(
    context: context,
    barrierDismissible: false, // dialog is dismissible with a tap on the barrier
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Enter the name of the event'),
        content: new Row(
          children: <Widget>[
            new Expanded(
                child: new TextField(
                  controller: namecontroller,
                  autofocus: true,
                  decoration: new InputDecoration(
                  labelText: 'Event Name', hintText: 'eg. Devspace'),
            ))
          ],
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Ok'),
            onPressed: () async {
              if (action == "create") {
                String eventName = namecontroller.text;
                http.Response res = await http.post(
                  "http://timespacevit.herokuapp.com/createEvent",
                  headers: {
                  "Accept": "application/json",
                  "Content-Type": "application/x-www-form-urlencoded"
                    }, 
                body: {"event": eventName});

                if (res.statusCode == 200) {
                  final prefs = await SharedPreferences.getInstance();
                  prefs.setString("event", eventName);
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> IssuesPage()));
                }
              } else {

              }
            },
          ),
        ],
      );
    },
  );
}

  @override
  Widget build(BuildContext context) {
    final alucard = Hero(
      tag: 'hero',
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: CircleAvatar(
          radius: 72.0,
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage('assets/logo.png'),
        ),
      ),
    );

    final welcome = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Welcome $username!',
        style: TextStyle(fontSize: 28.0, color: Colors.white),
      ),
    );

    final lorem = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Create a new event, or join an existing event:',
        style: TextStyle(fontSize: 16.0, color: Colors.white),
      ),
    );

    final createButton = RaisedButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          onPressed: () {
            _asyncInputDialog(context, "create");
          },
          textColor: Colors.blue,
          padding: const EdgeInsets.all(0.0),
          child: Container(
            width: 250,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20))
            ),
            padding: const EdgeInsets.all(25.0),
            child: Text('Create Event', 
            style:TextStyle(fontSize: 20),textAlign: TextAlign.center),
          ),
        );
      
      final joinEvent = RaisedButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          onPressed: () {_asyncInputDialog(context, "join");},
          textColor: Colors.blue,
          padding: const EdgeInsets.all(0.0),
          child: Container(
            width: 250,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20))
            ),
            padding: const EdgeInsets.all(25.0),
            child: Text('Join Event', 
            style:TextStyle(fontSize: 20),textAlign: TextAlign.center),
          ),
        );

    final body = Container(
      width: MediaQuery.of(context).size.width,
      height:MediaQuery.of(context).size.height,
      padding: EdgeInsets.all(28.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.lightBlue,
          Colors.lightBlueAccent,
        ]),
      ),
      child: Column(
        children: <Widget>[alucard, welcome, lorem, SizedBox(height: 100.0), createButton, SizedBox(height: 50), joinEvent],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.menu), onPressed: () {},),
        title: Text("$username's Home"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {},
          ),
        ],


      ),
    );
  }
}
