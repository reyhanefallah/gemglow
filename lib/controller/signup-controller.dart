import 'package:flutter/material.dart';
import 'package:gemglow/constants/helper-function.dart';
import 'package:gemglow/constants/widgets-page/loader.dart';
import 'package:gemglow/data/repository/auth-repository.dart';
import 'package:gemglow/data/repository/user-repository.dart';
import 'package:gemglow/data/utils/network-manager.dart';
import 'package:gemglow/model/user-model.dart';
import 'package:gemglow/view/verify-email-screen.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final email = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userName = TextEditingController();
  final password = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  void signup() async {
    try {
      //start loading
      GFullScreenLoader.openLoadingDialog(
          'در حال پردازش اطلاعات...', 'assets/png/jewel.png');

      //check internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        GFullScreenLoader.stopLoading();
        return;
      }

      //form validation
      if (signupFormKey.currentState!.validate()) {
        GFullScreenLoader.stopLoading();
        return;
      }

      //privacy policy check
      if (!privacyPolicy.value) {
        GLoaders.warningSnackBar(
            title: 'پذبرش قوانین الزامی است',
            message:
                'برای ادامه ثبت نام قوانین را خوانده و گزینه قوانین را می پذیرم را فعال کنید');
        return;
      }

      //register user in firebase
      final UserCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      //save auth user data
      final newUser = UserModel(
        id: UserCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        userName: userName.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      GFullScreenLoader.stopLoading();

      //success message
      GLoaders.successSnackBar(
          title: 'تبریک',
          message:
              'حساب شما با موفقیت ساخته شد. برای ادامه ایمیل خود را تایید کنید.');

      Get.to(
        () => VerifyEmailScreen(
          email: email.text.trim(),
        ),
      );
    } catch (e) {
      GLoaders.errorSnackBar(title: 'خطا', message: e.toString());
    } finally {
      GFullScreenLoader.stopLoading();
    }
  }
}
