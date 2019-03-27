import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:login/home_page.dart';
class LoginPage extends StatefulWidget {
  static String tag = 'login-page';
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController nameController;
  TextEditingController passwordController;
  String username,passkey;

  void initState() {
    super.initState();
    username="";
    passkey="";
    getUserName();
    getUserPass();
  }

  Future<String> getUserName() async {
    SharedPreferences namePref = await SharedPreferences.getInstance();

    username = namePref.getString('name');

    setState(() {
      nameController = new TextEditingController(text: username);
    });

    return username;
  }

Future<String> getUserPass() async {
    SharedPreferences passPref = await SharedPreferences.getInstance();

    username = passPref.getString('pass');

    setState(() {
      passwordController = new TextEditingController(text: passkey);
    });

    return passkey;
  }

  @override
  Widget build(BuildContext context) {
    
    final heading = Text(
        "GameOn",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
        textAlign: TextAlign.center
    );

    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('assets/logo.png'),
      ),
    );

    final name = TextFormField(
      controller: nameController,
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'email/username',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final pass = TextFormField(
      controller: passwordController,
      keyboardType: TextInputType.text,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () async {
          final prefs = await SharedPreferences.getInstance();

          username = nameController.text;
          passkey =passwordController.text;

          //Pass value to servers
          
          // set value
          prefs.setString("name", username);
          prefs.setString("pass", passkey);
          Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage(username,passkey)));
          // obtain shared preferences
        },
        padding: EdgeInsets.all(12),
        color: Colors.lightBlueAccent,
        child: Text('Log In', style: TextStyle(color: Colors.white, fontSize: 20)),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            heading,
            SizedBox(height: 15.0),
            logo,
            SizedBox(height: 48.0),
            name,
            SizedBox(height: 8.0),
            loginButton
          ],
        ),
      ),
    );
  }
}
