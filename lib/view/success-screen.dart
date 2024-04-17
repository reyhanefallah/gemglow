import 'package:flutter/material.dart';
import 'package:gemglow/constants/color-string.dart';
import 'package:gemglow/constants/text-style.dart';
import 'package:gemglow/constants/widgets/widgets.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({
    super.key,
    required this.onPressed,
    required this.image,
    required this.title,
    required this.subtitle,
  });

  final VoidCallback onPressed;
  final String image, title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                Image(image: AssetImage(image), width: 80),
                SizedBox(height: 24),
                Text(title,
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.center),
                SizedBox(height: 24),
                Text(subtitle,
                    style: Theme.of(context).textTheme.labelMedium,
                    textAlign: TextAlign.center),
                SizedBox(height: 24),
                GElevatedButton(
                    Gcolor: GColor.primaryColor1,
                    Gtitle: 'ادامه',
                    Gstyle: GTextStyle.displayLarge1,
                    GonPressed: onPressed),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
