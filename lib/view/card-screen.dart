import 'package:flutter/material.dart';
import 'package:gemglow/constants/color-string.dart';
import 'package:gemglow/constants/widgets-page/animation-loader.dart';
import 'package:gemglow/constants/widgets-page/card-items.dart';
import 'package:gemglow/constants/widgets/appbar.dart';
import 'package:gemglow/constants/widgets/widgets.dart';
import 'package:gemglow/controller/cart-controller.dart';
import 'package:gemglow/view/checkout-screen.dart';
import 'package:gemglow/view/navigation-bar-screen.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:iconsax/iconsax.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;

    return Scaffold(
      appBar: GAppBar(
        leadingIcon: IconButton(
          icon: Icon(Iconsax.arrow_right_3),
          onPressed: () => Get.back(),
        ),
        title:
            Text('سبد خرید', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: Obx(() {
        final emptyWidget = GAnimationLoaderWidget(
          text: 'سبد خرید خالی است',
          animation: '',
          showAcction: true,
          actionText: 'برای افزودن محصول به فروشگاه بروید',
          onActionPressed: () => Get.off(() => NavigationBarScreen()),
        );

        if (controller.cartItems.isEmpty) {
          return emptyWidget;
        } else {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(24),
              child: GCardItems(),
            ),
          );
        }
      }),
      bottomNavigationBar: controller.cartItems.isEmpty
          ? SizedBox()
          : Padding(
              padding: const EdgeInsets.all(24),
              // اینجا باید Gtitle میذاشتم توی obx
              child: Obx(
                () => GElevatedButton(
                  Gcolor: GColor.primaryColor1,
                  Gtitle: 'تکمیل خرید ${controller.totalCartPrice.value}',
                  Gstyle: TextStyle(color: Colors.white),
                  GonPressed: () => Get.to(() => CheckoutScreen()),
                ),
              ),
            ),
    );
  }
}
