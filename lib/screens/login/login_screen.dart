import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';

import '../../widgets/auth_screen.dart';

import '../../models/graphql/graphql_api.dart';
import '../../providers/auth_provider.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = "/login";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  void _onSubmit(
    RunMutation runMutation, {
    String email,
    String password,
    String username,
  }) {
    final data = LoginArguments(
      data: LoginInput(
        email: email,
        password: password,
      ),
    );

    runMutation(data.toJson());
  }

  @override
  Widget build(BuildContext context) {
    return Mutation(
      options: (MutationOptions(
        documentNode: LoginMutation().document,
        onCompleted: (data) {
          final loginData = Login$Mutation$Login.fromJson(data['login']);
          Provider.of<Auth>(context, listen: false)
              .authenticate(loginData.accessToken, loginData.refreshToken);
        },
      )),
      builder: (
        RunMutation runMutation,
        QueryResult result,
      ) =>
          AuthScreen(
        isLogin: true,
        isLoading: result.loading,
        isError: result.hasException,
        error: result.hasException && result.exception.graphqlErrors != null
            ? result.exception.graphqlErrors[0].message
            : null,
        isSuccess: result.data != null,
        onSubmit: ({
          String email,
          String password,
          String username,
        }) =>
            _onSubmit(
          runMutation,
          email: email,
          password: password,
          username: username,
        ),
      ),
    );
  }
}
