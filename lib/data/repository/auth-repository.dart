import 'package:flutter/foundation.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:gemglow/view/login-screen.dart';
import 'package:gemglow/view/onboarding-screen.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final deviceStorage = GetStorage();

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  // @override
  // void onInit(){
  // }

  screenRedirect() async {
    if (kDebugMode) {
      print('GET STORAGE');
      print(deviceStorage.read('IsFirstTime'));
    }

    deviceStorage.writeIfNull('IsFirstTime', true);
    deviceStorage.read('IsFirstTime') != true
        ? Get.offAll(() => LoginScreen())
        : Get.offAll(OnBoardingScreen());
  }
}
