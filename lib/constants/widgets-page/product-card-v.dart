import 'package:flutter/material.dart';
import 'package:gemglow/constants/color-string.dart';
import 'package:gemglow/constants/widgets-page/containers.dart';
import 'package:gemglow/constants/widgets-page/product-price.dart';
import 'package:gemglow/constants/widgets/card-widgets.dart';
import 'package:gemglow/constants/widgets/favourit-icon.dart';
import 'package:gemglow/constants/widgets/homewidgets.dart';
import 'package:gemglow/constants/widgets/shadow.dart';
import 'package:gemglow/constants/widgets/store-widgets.dart';
import 'package:gemglow/controller/product-controller.dart';
import 'package:gemglow/model/product-model.dart';
import 'package:gemglow/view/product-detail-screen.dart';
import 'package:get/get.dart';

class GProductCardVertical extends StatelessWidget {
  const GProductCardVertical({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage =
        controller.calculateSalePercentage(product.price, product.salePrice);

    return GestureDetector(
      onTap: () => Get.to(() => ProductDetailScreen(product: product)),
      child: Container(
        width: 180,
        padding: EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [GShadowStyle.VerticalProductShadow],
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Column(
          children: [
            RoundedContainer(
              height: 180,
              padding: EdgeInsets.all(5),
              backgroundColor: Colors.white,
              child: Stack(
                children: [
                  Center(
                    child: GRoundedImage(
                      imageUrl: product.thumbnail,
                      isNetworkImage: true,
                      applyImageRadius: true,
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                  if (salePercentage != null)
                    Positioned(
                      top: 12,
                      left: 0,
                      child: RoundedContainer(
                        radius: 10,
                        backgroundColor: GColor.primaryColor3.withOpacity(0.8),
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        child: Text(
                          '$salePercentage%',
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .apply(color: Colors.black),
                        ),
                      ),
                    ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: GFavouriteIcon(productId: product.id),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 3.5,
            ),
            Padding(
              padding: EdgeInsets.only(left: 5),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(
                      height: 3.5,
                    ),
                    BrandTitleWithVerifiedIcon(
                      title: product.brand!.name,
                    ),
                  ],
                ),
              ),
            ),
            // Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // if (product.productType ==
                      //         ProductType.single.toString() &&
                      //     product.salePrice > 0)
                      //   Padding(
                      //     padding: const EdgeInsets.only(right: 5),
                      //     child: Text(
                      //       product.price.toString(),
                      //       style: Theme.of(context)
                      //           .textTheme
                      //           .labelMedium!
                      //           .apply(decoration: TextDecoration.lineThrough),
                      //     ),
                      //   ),
                      // Padding(
                      //   padding: const EdgeInsets.only(right: 5),
                      //   child: GProductPriceText(
                      //       price: controller.getProductPrice(product)),
                      // ),
                      if (product.salePrice > 0)
                        Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: Text(
                            '${double.parse(product.price.toString())} تومان',
                            style:
                                Theme.of(context).textTheme.labelMedium!.apply(
                                      decoration: TextDecoration.lineThrough,
                                    ),
                          ),
                        ),
                      Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: GProductPriceText(
                          price: controller.getProductPrice(product),
                        ),
                      ),
                    ],
                  ),
                ),
                ProductCardAddToCartButton(product: product),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class GCircularIcon extends StatelessWidget {
  const GCircularIcon({
    super.key,
    this.width,
    this.height,
    this.size,
    required this.icon,
    this.color,
    this.backgroundColor,
    this.onPressed,
  });

  final double? width, height, size;
  final IconData icon;
  final Color? color;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        //color: Colors.white.withOpacity(0.9),
        color: backgroundColor,
        borderRadius: BorderRadius.circular(100),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: color,
          size: size,
        ),
      ),
    );
  }
}
