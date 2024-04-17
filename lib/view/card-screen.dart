import 'package:flutter/material.dart';
import 'package:gemglow/constants/color-string.dart';
import 'package:gemglow/constants/widgets-page/card-items.dart';
import 'package:gemglow/constants/widgets/appbar.dart';
import 'package:gemglow/constants/widgets/widgets.dart';
import 'package:gemglow/view/checkout-screen.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GAppBar(
        leadingIcon: IconButton(
          icon: Icon(Iconsax.arrow_right_3),
          onPressed: () => Get.back(),
        ),
        title:
            Text('سبد خرید', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: GCardItems(),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(24),
        child: GElevatedButton(
          Gcolor: GColor.primaryColor1,
          Gtitle: 'تکمیل خرید \$ 265',
          Gstyle: TextStyle(color: Colors.white),
          GonPressed: () => Get.to(() => CheckoutScreen()),
        ),
      ),
    );
  }
}
