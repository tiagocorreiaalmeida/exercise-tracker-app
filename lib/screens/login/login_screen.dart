import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = "/login";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Container(
        child: Form(
            child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Password'),
            ),
          ],
        )),
      ),
    );
  }
}
