import 'package:flutter/material.dart';
import 'package:gemglow/constants/color-string.dart';
import 'package:gemglow/constants/text-style.dart';
import 'package:gemglow/constants/widgets/widgets.dart';
import 'package:gemglow/view/Reset-Password-Screen.dart';
import 'package:get/get.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text('رمز عبور را فراموش کردید؟'),
              SizedBox(
                height: 25.0,
              ),
              Text(
                  'نگران نباشید ایمیل خود را وارد کنید تا ما یک لینک بازنشانی رمز عبور برای شما ارسال کنیم'),
              SizedBox(
                height: 25.0,
              ),
              GFormField(
                  Gstyle: GTextStyle.displayLarge2, Ghint: 'example@gmail.com'),
              SizedBox(
                height: 25.0,
              ),
              GElevatedButton(
                Gcolor: GColor.primaryColor1,
                Gtitle: 'ارسال',
                Gstyle: GTextStyle.displayLarge1,
                GonPressed: () => Get.off(
                  () => ResetPasswordScreen(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
