import 'package:flutter/material.dart';

Color generateHexColor(String colorHex) {
  return Color(int.parse(colorHex.replaceAll('#', '0xff')));
}
