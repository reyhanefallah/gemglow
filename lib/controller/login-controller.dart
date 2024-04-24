import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gemglow/constants/helper-function.dart';
import 'package:gemglow/constants/widgets-page/loader.dart';
import 'package:gemglow/data/repository/auth-repository.dart';
import 'package:gemglow/data/utils/network-manager.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  // void onInit() {
  //   email.text = localStorage.read('remember me email');
  //   password.text = localStorage.read('remember me password');
  //   super.onInit();
  // }

  Future<void> emailAndPasswordSignIn() async {
    try {
      GFullScreenLoader.openLoadingDialog('در حال وارد شدن به حساب...', '');

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        GFullScreenLoader.stopLoading();
        return;
      }

      if (!loginFormKey.currentState!.validate()) {
        GFullScreenLoader.stopLoading();
        return;
      }

      if (rememberMe.value) {
        localStorage.write('remember me email', email.text.trim());
        localStorage.write('remember me password', password.text.trim());
      }

      final UserCredential = await AuthenticationRepository.instance
          .loginwithEmailAndPassword(email.text.trim(), password.text.trim());

      GFullScreenLoader.stopLoading();

      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      GFullScreenLoader.stopLoading();
      GLoaders.errorSnackBar(title: 'خطایی رخ داده', message: e.toString());
    }
  }
}
