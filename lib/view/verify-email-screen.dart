import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gemglow/constants/color-string.dart';
import 'package:gemglow/constants/text-style.dart';
import 'package:gemglow/constants/widgets/widgets.dart';
import 'package:gemglow/controller/verify-email-controller.dart';
import 'package:gemglow/data/repository/auth-repository.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({
    super.key,
    this.email,
  });

  final String? email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => AuthenticationRepository.instance.logout(),
            icon: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(color: Colors.black45)),
              child: Icon(CupertinoIcons.clear),
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
                Text('ایمیل خود را تایید کنید',
                    style: Theme.of(context).textTheme.headlineMedium),
                SizedBox(
                  height: 25.0,
                ),
                Text(email ?? '',
                    style: Theme.of(context).textTheme.labelLarge),
                SizedBox(
                  height: 25.0,
                ),
                Text(
                    'تبریک! حساب کاربری شما در انتظار است: ایمیل خود را تایید کنید تا خرید را شروع کنید و دنیایی از معاملات بی نظیر پیشنهادهای شخصی را تجربه کنید',
                    style: Theme.of(context).textTheme.labelMedium),
                SizedBox(
                  height: 25.0,
                ),
                GElevatedButton(
                  Gcolor: GColor.primaryColor1,
                  Gtitle: 'ادامه',
                  Gstyle: GTextStyle.displayLarge1,
                  GonPressed: () => controller.checkEmailVerifictionStatus(),
                ),
                SizedBox(
                  height: 25.0,
                ),
                ElevatedButton(
                  onPressed: () => controller.sendEmailVerification(),
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
