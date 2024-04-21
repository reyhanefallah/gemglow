import 'package:flutter/material.dart';
import 'package:gemglow/constants/widgets/login-widgets.dart';
import 'package:gemglow/constants/widgets/signup-widgets.dart';
import 'package:gemglow/constants/widgets/widgets.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('ساخت حساب کاربری',
                  style: Theme.of(context).textTheme.headlineMedium),
              SizedBox(height: 32),
              GSingupForm(),
              SizedBox(height: 32),
              GFormDivider(dividerText: 'ثبت نام با'.capitalize!),
              SizedBox(height: 32),
              GSocialButtons(),
              SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
