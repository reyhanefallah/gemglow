import 'package:flutter/material.dart';
import 'package:gemglow/constants/color-string.dart';
import 'package:gemglow/constants/text-style.dart';
import 'package:gemglow/constants/widgets/widgets.dart';
import 'package:gemglow/controller/forget-password-controller.dart';
import 'package:gemglow/data/utils/validation.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
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
                Form(
                  key: controller.forgetPasswordFormKey,
                  child: TextFormField(
                    controller: controller.email,
                    validator: GValidator.validateEmail,
                    decoration: InputDecoration(
                      label: Text('ایمیل'),
                      prefixIcon: Icon(Iconsax.direct_right),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: GColor.primaryColor2),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25.0,
                ),
                GElevatedButton(
                  Gcolor: GColor.primaryColor1,
                  Gtitle: 'ارسال',
                  Gstyle: GTextStyle.displayLarge1,
                  GonPressed: () => controller.sendPasswordResetEmail(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
