import 'package:flutter/material.dart';
import 'package:gemglow/constants/helper-function.dart';
import 'package:gemglow/constants/widgets-page/loader.dart';
import 'package:gemglow/data/repository/auth-repository.dart';
import 'package:gemglow/data/utils/network-manager.dart';
import 'package:gemglow/view/Reset-Password-Screen.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  sendPasswordResetEmail() async {
    try {
      GFullScreenLoader.openLoadingDialog('در حال بررسی درخواست...', '');

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        GFullScreenLoader.stopLoading();
        return;
      }

      if (!forgetPasswordFormKey.currentState!.validate()) {
        GFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email.text.trim());

      GFullScreenLoader.stopLoading();

      GLoaders.successSnackBar(
          title: 'ایمیل ارسال شد',
          message: 'برای تغییر گذرواژه روی لینک ارسال شده کلیک کنید'.tr);

      Get.to(() => ResetPasswordScreen(email: email.text.trim()));
    } catch (e) {
      GFullScreenLoader.stopLoading();
      GLoaders.errorSnackBar(title: 'خطایی رخ داده', message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
    try {
      GFullScreenLoader.openLoadingDialog('در حال بررسی درخواست...', '');

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        GFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      GFullScreenLoader.stopLoading();

      GLoaders.successSnackBar(
          title: 'ایمیل ارسال شد',
          message: 'برای تغییر گذرواژه روی لینک ارسال شده کلیک کنید'.tr);
    } catch (e) {
      GFullScreenLoader.stopLoading();
      GLoaders.errorSnackBar(title: 'خطایی رخ داده', message: e.toString());
    }
  }
}
