import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GHelperFunction {
  static double screenHeight() {
    return MediaQuery.of(Get.context!).size.height;
  }

  static double screenWidth() {
    return MediaQuery.of(Get.context!).size.width;
  }
}
