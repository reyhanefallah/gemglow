import 'package:flutter/material.dart';
import 'package:gemglow/constants/color-string.dart';
import 'package:gemglow/constants/widgets/appbar.dart';
import 'package:gemglow/constants/widgets/widgets.dart';
import 'package:gemglow/controller/user-controller.dart';
import 'package:gemglow/data/utils/validation.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ReAuthLoginFormScreen extends StatelessWidget {
  const ReAuthLoginFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: GAppBar(
        title: Text('احراز هویت مجدد کاربر'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Form(
            key: controller.reAuthFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: controller.verifyEmail,
                  validator: GValidator.validateEmail,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.direct_right),
                    labelText: 'ایمیل',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: GColor.primaryColor2),
                    ),
                  ),
                ),
                SizedBox(height: 24),
                Obx(
                  () => TextFormField(
                    obscureText: controller.hidePassword.value,
                    controller: controller.verifyPassword,
                    validator: (value) =>
                        GValidator.validateEmptyText('password', value),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Iconsax.password_check),
                      labelText: 'گذرواژه',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: GColor.primaryColor2),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () => controller.hidePassword.value =
                            !controller.hidePassword.value,
                        icon: Icon(Iconsax.eye_slash),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 32),
                GElevatedButton(
                  Gcolor: GColor.primaryColor1,
                  Gtitle: 'تایید',
                  Gstyle: TextStyle(color: Colors.white),
                  GonPressed: () =>
                      controller.reAuthenticateEmailAndPasswordUser(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
