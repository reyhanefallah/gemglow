import 'package:flutter/material.dart';
import 'package:gemglow/constants/helper-function.dart';
import 'package:gemglow/constants/widgets-page/loader.dart';
import 'package:gemglow/controller/user-controller.dart';
import 'package:gemglow/data/repository/auth-repository.dart';
import 'package:gemglow/data/utils/network-manager.dart';
import 'package:gemglow/view/navigation-bar-screen.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());

  Future<void> emailAndPasswordSignIn() async {
    try {
      GFullScreenLoader.openLoadingDialog(
          'در حال وارد شدن به حساب...', 'assets/animation/loading.json');

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

  Future<void> googleSignIn() async {
    try {
      GFullScreenLoader.openLoadingDialog(
          'در حال وارد شدن به حساب ...', 'assets/animation/loading.json');

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        GFullScreenLoader.stopLoading();
        return;
      }

      final userCredentials =
          await AuthenticationRepository.instance.signInWithGoogle();

      await userController.saveUserRecord(userCredentials);

      GFullScreenLoader.stopLoading();

      // add from chatgpt
      Get.to(() => NavigationBarScreen());
    } catch (e) {
      GFullScreenLoader.stopLoading();

      GLoaders.errorSnackBar(
          title: 'خطایی رخ داده دوباره امتحان کنید', message: e.toString());
    }
  }
}
