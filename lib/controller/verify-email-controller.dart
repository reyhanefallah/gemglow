import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:gemglow/constants/widgets-page/loader.dart';
import 'package:gemglow/data/repository/auth-repository.dart';
import 'package:gemglow/view/success-screen.dart';
import 'package:get/get.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      GLoaders.successSnackBar(
          title: 'ایمیل ارسال شد', message: 'ایمیل ها را چک و تایید کنید');
    } catch (e) {
      GLoaders.errorSnackBar(title: 'خطایی رخ داده', message: e.toString());
    }
  }

  setTimerForAutoRedirect() {
    Timer.periodic(
      Duration(seconds: 1),
      (timer) async {
        await FirebaseAuth.instance.currentUser?.reload();
        final user = FirebaseAuth.instance.currentUser;
        if (user?.emailVerified ?? false) {
          timer.cancel();
          Get.off(
            () => SuccessScreen(
                onPressed: () =>
                    AuthenticationRepository.instance.screenRedirect(),
                image: 'assets/png/check .png',
                title: 'حساب شما با موفقیت ساخته شد',
                subtitle: 'به فروشگاه gemglow خوش آمدید'),
          );
        }
      },
    );
  }

  checkEmailVerifictionStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(
        () => SuccessScreen(
            onPressed: () => AuthenticationRepository.instance.screenRedirect(),
            image: 'assets/png/check .png',
            title: 'حساب شما با موفقیت ساخته شد',
            subtitle: 'به فروشگاه gemglow خوش آمدید'),
      );
    }
  }
}
