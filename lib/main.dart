import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/home/home_screen.dart';
import './screens/login/login_screen.dart';
import './screens/register/register_screen.dart';
import './screens/dashboard/dashboard_screen.dart';

import './providers/auth_provider.dart';
import './utils/generate_hex_color.dart';
import './providers/graphql_provider.dart';

void main() {
  runApp(MyApp());
}

const host = '192.168.1.65';

final graphqlEndpoint = 'http://$host:4000/graphql';
final subscriptionEndpoint = 'ws://$host:4000/subscriptions';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: Auth(),
      child: ClientProvider(
        uri: graphqlEndpoint,
        subscriptionUri: graphqlEndpoint,
        child: Consumer<Auth>(
          builder: (ctx, auth, _) => MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primaryColor: generateHexColor("#5063EE"),
              fontFamily: 'Rubik',
              textTheme: ThemeData.light().textTheme.copyWith(),
              primarySwatch: Colors.blue,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: auth.isAuth
                ? DashboardScreen()
                : FutureBuilder(
                    future: auth.tryToLoginBack(),
                    builder: (ctx, authResultSnapShot) {
                      return authResultSnapShot.connectionState ==
                              ConnectionState.waiting
                          ? Text("Loading")
                          : HomeScreen();
                    },
                  ),
            routes: {
              RegisterScreen.routeName: (ctx) => RegisterScreen(),
              LoginScreen.routeName: (ctx) => LoginScreen(),
            },
          ),
        ),
      ),
    );
  }
}
