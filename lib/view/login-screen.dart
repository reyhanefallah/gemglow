import 'package:flutter/material.dart';
import 'package:gemglow/constants/color-string.dart';
import 'package:gemglow/constants/widgets/login-widgets.dart';
import 'package:gemglow/constants/widgets/widgets.dart';
import 'package:gemglow/view/navigation-bar-screen.dart';
import 'package:gemglow/view/signup-screen.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            children: [
              // logo & title & subtitle
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(
                    image: AssetImage(''),
                    height: 150,
                  ),
                  Text('title',
                      style: Theme.of(context).textTheme.headlineMedium),
                  SizedBox(height: 8),
                  Text('subtitle',
                      style: Theme.of(context).textTheme.headlineMedium),
                ],
              ),
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        label: Text('ایمیل'),
                        prefixIcon: Icon(Iconsax.direct_right),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: GColor.primaryColor2),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      decoration: InputDecoration(
                        label: Text('گذرواژه'),
                        prefixIcon: Icon(Iconsax.password_check),
                        suffixIcon: Icon(Iconsax.eye_slash),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: GColor.primaryColor2),
                        ),
                      ),
                    ),
                    SizedBox(height: 16 / 2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //remember me
                        Row(
                          children: [
                            Checkbox(value: true, onChanged: (value) {}),
                            SizedBox(width: 16),
                            Text('مرا بخاطر داشته باش'),
                          ],
                        ),
                        //forget password
                        TextButton(
                          onPressed: () {},
                          child: Text('فراموشی رمز'),
                        ),
                      ],
                    ),
                    SizedBox(height: 32),
                    GElevatedButton(
                      Gcolor: GColor.primaryColor1,
                      Gtitle: 'ورود',
                      Gstyle: TextStyle(color: Colors.white),
                      GonPressed: () => Get.to(() => NavigationBarScreen()),
                    ),
                    SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      height: 60,
                      child: OutlinedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        onPressed: () => Get.to(() => SignUpScreen()),
                        child: Text('ساخت حساب'),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 32),
              GFormDivider(dividerText: 'یا ورود از طریق'),
              SizedBox(height: 32),
              GSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
