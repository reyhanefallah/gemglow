import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gemglow/constants/widgets/widgets.dart';
import 'package:gemglow/controller/login-controller.dart';
import 'package:get/get.dart';

class GSocialButtons extends StatelessWidget {
  const GSocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return GElevatedButton(
      Gcolor: Colors.transparent,
      Gtitle: 'google',
      Gstyle: TextStyle(color: Colors.black),
      GonPressed: () => controller.googleSignIn(),
      Gicon: Container(
        child: SvgPicture.asset(
          'assets/svg/google.svg',
          width: 35,
          height: 35,
        ),
      ),
      Gelevation: 0.0,
      GborderSide: BorderSide(color: Colors.black45),
    );
  }
}
