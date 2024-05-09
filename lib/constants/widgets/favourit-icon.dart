import 'package:flutter/material.dart';
import 'package:gemglow/constants/widgets-page/product-card-v.dart';
import 'package:gemglow/controller/favourit-controller.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class GFavouriteIcon extends StatelessWidget {
  const GFavouriteIcon({
    super.key,
    required this.productId,
  });

  final String productId;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavouritesController());

    return Obx(
      () => GCircularIcon(
        icon:
            controller.isFavourite(productId) ? Iconsax.heart5 : Iconsax.heart,
        color: controller.isFavourite(productId) ? Colors.red : null,
        backgroundColor: Colors.transparent,
        onPressed: () => controller.toggleFavoriteProduct(productId),
      ),
    );
  }
}
