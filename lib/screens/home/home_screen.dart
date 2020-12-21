import 'package:flutter/material.dart';

import '../register/register_screen.dart';
import '../login/login_screen.dart';

import '../../utils/generate_hex_color.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _isLogin = false;

  String get screenDescription {
    return _isLogin ? "Sign In to continue" : "Sign up to continue";
  }

  String get buttonActionText {
    return _isLogin ? "Sign In" : "Sign Up";
  }

  String get reversedActionButtonText {
    return _isLogin ? "Sign Up" : "Sign In";
  }

  String get reversedActionLabelText {
    return _isLogin ? "Don't have an account?" : "Already have an account?";
  }

  onTakeActionPress() {
    final routeName =
        _isLogin ? LoginScreen.routeName : RegisterScreen.routeName;

    Navigator.of(context).pushNamed(routeName);
  }

  onTakeActionWithGooglePress() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 145, top: 70, left: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 30),
                      child: Image.asset(
                        "assets/images/logo.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                    Text(
                      "Welcome to kenko",
                      style: TextStyle(
                        fontSize: 34,
                        fontFamily: 'Questrial',
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      screenDescription,
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 58),
                    child: SizedBox(
                      width: 272,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 2),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  generateHexColor("#5063EE"),
                                  generateHexColor("#23253A"),
                                ],
                                transform: GradientRotation(315),
                              ),
                            ),
                            child: FlatButton(
                              padding: EdgeInsets.symmetric(vertical: 22),
                              onPressed: onTakeActionPress,
                              child: Text(
                                buttonActionText.toUpperCase(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  letterSpacing: 2,
                                ),
                              ),
                            ),
                          ),
                          OutlineButton(
                            borderSide: BorderSide(
                              color: generateHexColor("#5063EE"),
                              width: 1,
                            ),
                            padding: EdgeInsets.symmetric(vertical: 22),
                            onPressed: onTakeActionWithGooglePress,
                            child: Text(
                              "$buttonActionText with google".toUpperCase(),
                              style: TextStyle(
                                color: generateHexColor("#5063EE"),
                                fontSize: 15,
                                letterSpacing: 2,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 32),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          reversedActionLabelText,
                          style: TextStyle(
                            color: generateHexColor("#26262B"),
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              _isLogin = !_isLogin;
                            });
                          },
                          child: Text(
                            reversedActionButtonText.toUpperCase(),
                            style: TextStyle(
                              color: generateHexColor("#5063EE"),
                              fontSize: 15,
                              letterSpacing: 2,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
