import 'package:flutter/material.dart';
import 'package:gemglow/constants/color-string.dart';
import 'package:gemglow/constants/text-style.dart';
import 'package:gemglow/constants/widgets/widgets.dart';
import 'package:gemglow/view/login-screen.dart';
import 'package:gemglow/view/success-screen.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => Get.offAll(LoginScreen()),
            icon: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(color: Colors.black45)),
              child: Icon(Icons.arrow_forward_rounded),
            ),
          ),
        ],
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                Text('ایمیل خود را تایید کنید'),
                SizedBox(
                  height: 25.0,
                ),
                Text(
                    'تبریک! حساب کاربری شما در انتظار است: ایمیل خود را تایید کنید تا خرید را شروع کنید و دنیایی از معاملات بی نظیر پیشنهادهای شخصی را تجربه کنید'),
                SizedBox(
                  height: 25.0,
                ),
                GElevatedButton(
                  Gcolor: GColor.primaryColor1,
                  Gtitle: 'ادامه',
                  Gstyle: GTextStyle.displayLarge1,
                  GonPressed: () => Get.to(
                    () => SuccessScreen(
                      onPressed: () => Get.to(() => LoginScreen()),
                      title: 'حساب شما با موفقیت ایجاد شد!',
                      image: '',
                      subtitle:
                          'به مقصد نهایی خوش آمدید حساب شما ایجاد شده است. از خرید انلاین لذت ببرید',
                    ),
                  ),
                ),
                SizedBox(
                  height: 25.0,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('ارسال دوباره ایمیل'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
