import 'package:flutter/material.dart';

import './screens/home/home_screen.dart';
import './screens/login/login_screen.dart';
import './screens/register/register_screen.dart';

import './utils/generate_hex_color.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: generateHexColor("#5063EE"),
        fontFamily: 'Rubik',
        textTheme: ThemeData.light().textTheme.copyWith(),
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
      routes: {
        RegisterScreen.routeName: (ctx) => RegisterScreen(),
        LoginScreen.routeName: (ctx) => LoginScreen(),
      },
    );
  }
}
