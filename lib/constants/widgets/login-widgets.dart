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

    // Row(
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   children: [
    //     Container(
    //       decoration: BoxDecoration(
    //         border: Border.all(color: GColor.primaryColor2),
    //         borderRadius: BorderRadius.circular(100),
    //       ),
    //       child: IconButton(
    //         onPressed: () => controller.googleSignIn(),
    //         icon: SvgPicture.asset(
    //           "assets/svg/google.svg",
    //           height: 24,
    //           width: 24,
    //         ),
    //       ),
    //     ),
    //     SizedBox(width: 16),
    //     Container(
    //       decoration: BoxDecoration(
    //         border: Border.all(color: GColor.primaryColor2),
    //         borderRadius: BorderRadius.circular(100),
    //       ),
    //       child: IconButton(
    //         onPressed: () {},
    //         icon: SvgPicture.asset(
    //           "assets/svg/google.svg",
    //           height: 24,
    //           width: 24,
    //         ),
    //         // Image(
    //         //   width: 24,
    //         //   height: 24,
    //         //   image: AssetImage('assets/svg/google.svg'),
    //         // ),
    //       ),
    //     ),
    //   ],
    // );
  }
}
