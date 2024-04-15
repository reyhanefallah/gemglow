import 'package:flutter/material.dart';

class GHelperFunctions {
  static Color getColor(String value) {
    switch (value.toLowerCase()) {
      case 'سبز':
        return Colors.green;
      case 'آبی':
        return Colors.blue;
      case 'قرمز':
        return Colors.red;
      case 'زرد':
        return Colors.yellow;
      case 'بنفش':
        return Colors.purple;
      case 'سیاه':
        return Colors.black;
      case 'سفید':
        return Colors.white;
      case 'خاکستری':
        return Colors.grey;
      default:
        return Colors.grey;
    }
  }
}
