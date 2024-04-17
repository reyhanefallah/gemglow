import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gemglow/constants/color-string.dart';
import 'package:gemglow/constants/text-style.dart';
import 'package:gemglow/constants/widgets/widgets.dart';
import 'package:gemglow/view/login-screen.dart';
import 'package:gemglow/view/verify-email-screen.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  SizedBox(
                    child: Text('ساخت حساب کاربری'),
                  ),
                  Form(
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text('نام کاربری'),
                        ),
                        GFormField(
                            Gstyle: GTextStyle.displayLarge2, Ghint: 'نام'),
                        SizedBox(
                          height: 25.0,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text('ایمیل'),
                        ),
                        GFormField(
                            Gstyle: GTextStyle.displayLarge2,
                            Ghint: 'example@gmail.com'),
                        SizedBox(
                          height: 25.0,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text('گذرواژه'),
                        ),
                        GFormField(
                          Gstyle: GTextStyle.displayLarge2,
                          Ghint: '************',
                          Gicon: Icon(Icons.visibility_off_outlined),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  GElevatedButton(
                    Gcolor: GColor.primaryColor1,
                    Gtitle: 'ثبت نام',
                    Gstyle: GTextStyle.displayLarge1,
                    GonPressed: () => Get.to(
                      () => VerifyEmailScreen(),
                    ),
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                          child: Divider(
                        color: Colors.black,
                        thickness: 0.5,
                        indent: 60,
                        endIndent: 5,
                      )),
                      Text('یا ورود به حساب از طریق'),
                      Flexible(
                          child: Divider(
                        color: Colors.black,
                        thickness: 0.5,
                        indent: 5,
                        endIndent: 60,
                      )),
                    ],
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  GElevatedButton(
                    Gcolor: Colors.white,
                    Gtitle: 'google',
                    Gstyle: GTextStyle.displayLarge2,
                    GonPressed: () {},
                    Gicon: SvgPicture.asset(
                      "assets/svg/google.svg",
                      height: 45,
                      width: 45,
                    ),
                    GborderSide: BorderSide(color: GColor.primaryColor2),
                    Gelevation: 0.0,
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  RichText(
                    text: TextSpan(text: 'حساب کاربری دارید؟', children: [
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Get.to(() => LoginScreen()),
                        text: 'ورود',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: GColor.primaryColor1),
                      ),
                    ]),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
