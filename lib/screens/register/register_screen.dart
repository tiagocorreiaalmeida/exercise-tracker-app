import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../widgets/auth_screen.dart';

import '../../models/graphql/graphql_api.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = "/register";

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  void _onSubmit(
    RunMutation runMutation, {
    String email,
    String password,
    String username,
  }) {
    final data = RegisterArguments(
      data: RegisterInput(email: email, password: password, username: username),
    );

    runMutation(data.toJson());
  }

  @override
  Widget build(BuildContext context) {
    return Mutation(
      options: (MutationOptions(
        documentNode: RegisterMutation().document,
      )),
      builder: (
        RunMutation runMutation,
        QueryResult result,
      ) =>
          AuthScreen(
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
