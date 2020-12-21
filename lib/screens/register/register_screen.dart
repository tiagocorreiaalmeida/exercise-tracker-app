import 'package:flutter/material.dart';

import '../../widgets/auth_screen.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = "/register";

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  void _onSubmit({
    String email,
    String password,
    String username,
  }) {
    print("email: " + email);
    print("password: " + password);
    print("username: " + password);
  }

  @override
  Widget build(BuildContext context) {
    return AuthScreen(onSubmit: _onSubmit);
  }
}
