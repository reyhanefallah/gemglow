import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gemglow/constants/color-string.dart';
import 'package:gemglow/constants/text-style.dart';
import 'package:gemglow/constants/widgets/widgets.dart';
import 'package:gemglow/view/forget-password-screen.dart';
import 'package:gemglow/view/navigation-bar-screen.dart';
import 'package:gemglow/view/signup-screen.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  SizedBox(
                    child: Text('ورود به حساب کاربری'),
                  ),
                  Form(
                    child: Column(
                      children: [
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
                          Ghint: '****************',
                          Gicon: Icon(Icons.visibility_off_outlined),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  RichText(
                    text: TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Get.to(() => ForgetPasswordScreen()),
                      text: 'رمز عبور را فراموش کردید؟',
                      style: TextStyle(
                          color: GColor.primaryColor1,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  GElevatedButton(
                      GonPressed: () => Get.to(() => NavigationBarScreen()),
                      Gcolor: GColor.primaryColor1,
                      Gtitle: 'ورود',
                      Gstyle: GTextStyle.displayLarge1),
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
                    GonPressed: () {},
                    Gcolor: Colors.white,
                    Gtitle: 'google',
                    Gstyle: GTextStyle.displayLarge2,
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
                    text: TextSpan(text: 'حساب کاربری ندارید؟', children: [
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Get.to(() => SignUpScreen()),
                        text: 'ثبت نام کنید',
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
