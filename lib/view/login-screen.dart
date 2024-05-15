import 'package:flutter/material.dart';
import 'package:gemglow/constants/color-string.dart';
import 'package:gemglow/constants/widgets/login-widgets.dart';
import 'package:gemglow/constants/widgets/widgets.dart';
import 'package:gemglow/controller/login-controller.dart';
import 'package:gemglow/data/utils/validation.dart';
import 'package:gemglow/view/forget-password-screen.dart';
import 'package:gemglow/view/signup-screen.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Column(
              children: [
                // logo & title & subtitle
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('GemGlow',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .apply(color: GColor.primaryColor1)),
                    SizedBox(height: 8),
                    Text('به دنیای درخشان سنگ‌های قیمتی خوش آمدید!',
                        style: Theme.of(context).textTheme.labelMedium),
                  ],
                ),
                SizedBox(height: 32),
                GLoginForm(),
                SizedBox(height: 32),
                GFormDivider(dividerText: 'یا ورود از طریق'),
                SizedBox(height: 32),
                GSocialButtons(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class GLoginForm extends StatelessWidget {
  const GLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      key: controller.loginFormKey,
      child: Column(
        children: [
          TextFormField(
            controller: controller.email,
            validator: (value) => GValidator.validateEmail(value),
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
          Obx(
            () => TextFormField(
              controller: controller.password,
              validator: (value) => GValidator.validationPassword(value),
              obscureText: controller.hidePassword.value,
              decoration: InputDecoration(
                label: Text('گذرواژه'),
                prefixIcon: Icon(Iconsax.password_check),
                suffixIcon: IconButton(
                  onPressed: () => controller.hidePassword.value =
                      !controller.hidePassword.value,
                  icon: Icon(controller.hidePassword.value
                      ? Iconsax.eye_slash
                      : Iconsax.eye),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: GColor.primaryColor2),
                ),
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
                  Obx(
                    () => Checkbox(
                      activeColor: GColor.primaryColor1,
                      value: controller.rememberMe.value,
                      onChanged: (value) => controller.rememberMe.value =
                          !controller.rememberMe.value,
                    ),
                  ),
                  SizedBox(width: 16),
                  Text('مرا بخاطر داشته باش'),
                ],
              ),
              //forget password
              TextButton(
                onPressed: () => Get.to(() => ForgetPasswordScreen()),
                child: Text('فراموشی رمز'),
              ),
            ],
          ),
          SizedBox(height: 32),
          GElevatedButton(
              Gcolor: GColor.primaryColor1,
              Gtitle: 'ورود',
              Gstyle: TextStyle(color: Colors.white),
              GonPressed: () => controller.emailAndPasswordSignIn()),
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
    );
  }
}
