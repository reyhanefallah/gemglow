import 'package:flutter/material.dart';
import 'package:gemglow/constants/color-string.dart';
import 'package:gemglow/constants/text-style.dart';
import 'package:gemglow/constants/widgets/widgets.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text('حساب شما با موفقیت ایجاد شد!'),
              Text(
                  'به مقصد نهایی خوش آمدید حساب شما ایجاد شده است. از خرید انلاین لذت ببرید'),
              GElevatedButton(
                  Gcolor: GColor.primaryColor1,
                  Gtitle: 'ادامه',
                  Gstyle: GTextStyle.displayLarge1,
                  GonPressed: onPressed),
            ],
          ),
        ),
      ),
    );
  }
}
