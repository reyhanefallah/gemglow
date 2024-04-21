import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gemglow/constants/color-string.dart';

class GSocialButtons extends StatelessWidget {
  const GSocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: GColor.primaryColor2),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              "assets/svg/google.svg",
              height: 24,
              width: 24,
            ),
          ),
        ),
        SizedBox(width: 16),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: GColor.primaryColor2),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              "assets/svg/google.svg",
              height: 24,
              width: 24,
            ),
            // Image(
            //   width: 24,
            //   height: 24,
            //   image: AssetImage('assets/svg/google.svg'),
            // ),
          ),
        ),
      ],
    );
  }
}
