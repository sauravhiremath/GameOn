import 'package:flutter/material.dart';
import 'package:cheat_app/chat_screen.dart';

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

      final name = TextFormField(
        // controller: myController,
        keyboardType: TextInputType.text,
        autofocus: false,
        decoration: InputDecoration(
          hintText: 'Event Name',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
        ),
      );

      final submit = MaterialButton(
        onPressed: ()=> ChatScreen(),
        child: Text("Submit"),
        );

      return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            name,
            SizedBox(height: 16.0),
            submit,
            SizedBox(height: 5.0)
          ],
        ),
      ),
    );
  }
}