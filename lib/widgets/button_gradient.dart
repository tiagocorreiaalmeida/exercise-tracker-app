import 'package:flutter/material.dart';

import '../utils/generate_hex_color.dart';

class ButtonGradient extends StatelessWidget {
  final String text;
  final Function onPress;

  const ButtonGradient({@required this.text, @required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Container(
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
        onPressed: onPress,
        child: Text(
          text.toUpperCase(),
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            letterSpacing: 2,
          ),
        ),
      ),
    );
  }
}
