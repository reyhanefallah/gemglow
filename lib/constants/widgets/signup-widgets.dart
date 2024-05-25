import 'package:flutter/material.dart';
import 'package:gemglow/constants/color-string.dart';
import 'package:gemglow/constants/widgets/widgets.dart';
import 'package:gemglow/controller/signup-controller.dart';
import 'package:gemglow/data/utils/validation.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class GSingupForm extends StatelessWidget {
  const GSingupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  validator: (value) =>
                      GValidator.validateEmptyText('نام', value),
                  expands: false,
                  decoration: InputDecoration(
                    label: Text('نام'),
                    prefixIcon: Icon(Iconsax.user),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: GColor.primaryColor2),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: TextFormField(
                  controller: controller.lastName,
                  validator: (value) =>
                      GValidator.validateEmptyText('نام خانوادگی', value),
                  expands: false,
                  decoration: InputDecoration(
                    label: Text('نام خانوادگی'),
                    prefixIcon: Icon(Iconsax.user),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: GColor.primaryColor2),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          TextFormField(
            controller: controller.userName,
            validator: (value) =>
                GValidator.validateEmptyText('نام کاربری', value),
            expands: false,
            decoration: InputDecoration(
              label: Text('نام کاربری'),
              prefixIcon: Icon(Iconsax.user_edit),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: GColor.primaryColor2),
              ),
            ),
          ),
          SizedBox(height: 16),
          TextFormField(
            controller: controller.email,
            validator: (value) => GValidator.validateEmail(value),
            expands: false,
            decoration: InputDecoration(
              label: Text('ایمیل'),
              prefixIcon: Icon(Iconsax.direct),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: GColor.primaryColor2),
              ),
            ),
          ),
          SizedBox(height: 16),
          TextFormField(
            controller: controller.phoneNumber,
            validator: (value) => GValidator.validatePhoneNumber(value),
            expands: false,
            decoration: InputDecoration(
              label: Text('تلفن'),
              prefixIcon: Icon(Iconsax.call),
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
          SizedBox(height: 32),
          GConditionCheckbox(),
          SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            child: GElevatedButton(
              Gcolor: GColor.primaryColor1,
              Gtitle: 'ساخت حساب',
              Gstyle: TextStyle(color: Colors.white),
              GonPressed: () => controller.signup(),
            ),
          ),
        ],
      ),
    );
  }
}

class GConditionCheckbox extends StatelessWidget {
  const GConditionCheckbox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = SignupController.instance;
    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Obx(
            () => Checkbox(
              activeColor: GColor.primaryColor1,
              value: controller.privacyPolicy.value,
              onChanged: (value) => controller.privacyPolicy.value =
                  !controller.privacyPolicy.value,
            ),
          ),
        ),
        SizedBox(width: 16),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'قوانین ',
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                    color: GColor.primaryColor1,
                    decoration: TextDecoration.underline,
                    decorationColor: GColor.primaryColor1),
              ),
              TextSpan(
                  text: ' می پذیرم',
                  style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ),
      ],
    );
  }
}
