import 'package:cheat_app/main.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _status = 'here';

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: new AppBar(
      title: new Text('TimeSpace'),
    ),
    body: Container(
      child: Center(
        child: RaisedButton(
          child: Text(
            'Login ${this._status}'
          ),
          onPressed: () {
            setState(() => this._status = '...');

            appAuth.login().then((result) {
              if (result) {
                Navigator.of(context).pushReplacementNamed('/home');
              } else {
                setState(() => this._status = 'rejected');
              }
            });
          }
        ),
      ),
    ),
  );
}