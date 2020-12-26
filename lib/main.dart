import 'package:exercise_tracker/graphql_provider.dart';
import 'package:flutter/material.dart';

import './screens/home/home_screen.dart';
import './screens/login/login_screen.dart';
import './screens/register/register_screen.dart';

import './utils/generate_hex_color.dart';

void main() {
  runApp(MyApp());
}

const host = '192.168.1.65';

final graphqlEndpoint = 'http://$host:4000/graphql';
final subscriptionEndpoint = 'ws://$host:4000/subscriptions';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClientProvider(
      uri: graphqlEndpoint,
      subscriptionUri: graphqlEndpoint,
      child: MaterialApp(
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
      ),
    );
  }
}
