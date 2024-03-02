import 'package:flutter/material.dart';
import 'package:gemglow/constants/color-string.dart';

class GTextStyle {
  static const String fontFamily = 'Rubik';

  static TextStyle displayLarge1 =
      TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white);

  static TextStyle displayLarge2 =
      TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.black);

  static TextStyle displaySmall =
      TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: Colors.white);

  static TextStyle displayTitle =
      TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: Colors.white);

  static TextStyle bodySmall = TextStyle(
      fontSize: 12, fontWeight: FontWeight.w700, color: GColor.primaryColor2);

  static TextStyle bodyboldSmall =
      TextStyle(fontSize: 16, fontWeight: FontWeight.w900, color: Colors.white);
}
