import 'package:flutter/material.dart';
import 'package:gemglow/constants/color-string.dart';
import 'package:gemglow/constants/text-style.dart';
import 'package:gemglow/constants/widgets/widgets.dart';
import 'package:get/get.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => Get.back(),
            icon: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(color: Colors.black45)),
              child: Icon(Icons.close),
            ),
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text('بازیابی رمز عبور ارسال شد'),
              SizedBox(
                height: 25.0,
              ),
              Text(
                  'امنیت حساب شما اولویت ماست! ما برای یک لینک امن برای تغییر رمز عبور ارسال کردیم'),
              SizedBox(
                height: 25.0,
              ),
              GElevatedButton(
                Gcolor: GColor.primaryColor1,
                Gtitle: 'انجام شد',
                Gstyle: GTextStyle.displayLarge1,
                GonPressed: () {},
              ),
              SizedBox(
                height: 25.0,
              ),
              TextButton(
                onPressed: () {},
                child: Text('ارسال دوباره ایمیل'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
