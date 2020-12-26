import 'package:exercise_tracker/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatelessWidget {
  static const routeName = "/dashboard";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("DashboardScreen"),
          FlatButton(
            onPressed: () {
              Provider.of<Auth>(context, listen: false).logout();
            },
            child: Text("Logout"),
          ),
        ],
      ),
    );
  }
}
