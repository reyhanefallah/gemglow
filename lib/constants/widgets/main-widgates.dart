import 'package:flutter/material.dart';
import 'package:gemglow/constants/color-string.dart';
import 'package:gemglow/constants/text-style.dart';
import 'package:gemglow/constants/widgets-page/shimmer.dart';
import 'package:gemglow/constants/widgets/appbar.dart';
import 'package:gemglow/controller/cart-controller.dart';
import 'package:gemglow/controller/user-controller.dart';
import 'package:gemglow/view/card-screen.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class CardCounter extends StatelessWidget {
  const CardCounter({
    super.key,
    this.iconColor,
  });

  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CartController());

    return Stack(
      children: [
        IconButton(
          onPressed: () => Get.to(() => CardScreen()),
          icon: Icon(
            Iconsax.shopping_bag,
            color: iconColor,
          ),
        ),
        Positioned(
          right: 0.0,
          child: Container(
            width: 18.0,
            height: 18.0,
            decoration: BoxDecoration(
              color: GColor.primaryColor3.withOpacity(0.5),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: Obx(
                () => Text(
                  controller.noOfCartItems.value.toString(),
                  style: GTextStyle.displaySmall,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class GHomeAppBar extends StatelessWidget {
  const GHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return GAppBar(
      title: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'GemGlow',
            style: GTextStyle.displayTitle,
          ),
          Obx(
            () {
              if (controller.profileLoading.value) {
                return GShimmerEffect(width: 80, height: 15);
              } else {
                return Text(
                  controller.user.value.fullName,
                  style: Theme.of(context).textTheme.headlineSmall,
                );
              }
            },
          ),
        ],
      ),
      actions: [
        CardCounter(
          // onPressed: () {},
          iconColor: Colors.white,
        ),
      ],
    );
  }
}

class SectionHeading extends StatelessWidget {
  const SectionHeading({
    super.key,
    this.textColor,
    this.showActionButton = true,
    required this.title,
    this.buttonTitle = 'نمایش همه',
    this.onPressed,
    this.space = MainAxisAlignment.spaceBetween,
  });

  final Color? textColor;
  final bool showActionButton;
  final String title, buttonTitle;
  final void Function()? onPressed;
  final MainAxisAlignment space;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: space,
      children: [
        Text(
          title,
          style: GTextStyle.bodyboldSmall.apply(color: textColor),
          maxLines: 1,
        ),
        if (showActionButton)
          TextButton(onPressed: onPressed, child: Text(buttonTitle)),
      ],
    );
  }
}
