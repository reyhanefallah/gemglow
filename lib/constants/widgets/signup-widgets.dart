import 'package:flutter/material.dart';
import 'package:gemglow/constants/color-string.dart';
import 'package:gemglow/constants/widgets/widgets.dart';
import 'package:gemglow/view/verify-email-screen.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class GSingupForm extends StatelessWidget {
  const GSingupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
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
          TextFormField(
            obscureText: true,
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
          SizedBox(height: 32),
          GConditionCheckbox(),
          SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            child: GElevatedButton(
              Gcolor: GColor.primaryColor1,
              Gtitle: 'ساخت حساب',
              Gstyle: TextStyle(color: Colors.white),
              GonPressed: () => Get.to(
                () => VerifyEmailScreen(),
              ),
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
    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Checkbox(value: true, onChanged: (value) {}),
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
              // TextSpan(
              //     text: 'و',
              //     style: Theme.of(context).textTheme.bodySmall),
              // TextSpan(
              //   text: 'termOfuse',
              //   style: Theme.of(context)
              //       .textTheme
              //       .bodyMedium!
              //       .apply(
              //           color: GColor.primaryColor1,
              //           decoration: TextDecoration.underline,
              //           decorationColor: GColor.primaryColor1),
              // ),
            ],
          ),
        ),
      ],
    );
  }
}
