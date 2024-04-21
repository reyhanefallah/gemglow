import 'package:flutter/material.dart';
import 'package:gemglow/constants/color-string.dart';
import 'package:gemglow/constants/image-strings.dart';
import 'package:gemglow/constants/widgets-page/containers.dart';
import 'package:gemglow/constants/widgets-page/product-price.dart';
import 'package:gemglow/constants/widgets/homewidgets.dart';
import 'package:gemglow/constants/widgets/shadow.dart';
import 'package:gemglow/constants/widgets/store-widgets.dart';
import 'package:gemglow/view/product-detail-screen.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class GProductCardVertical extends StatelessWidget {
  const GProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => ProductDetailScreen()),
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
                  GRoundedImage(
                    imageUrl: GImages.ProductImage4,
                    applyImageRadius: true,
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width,
                  ),
                  Positioned(
                    top: 12,
                    left: 0,
                    child: RoundedContainer(
                      radius: 10,
                      backgroundColor: GColor.primaryColor3.withOpacity(0.8),
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      child: Text(
                        '25%',
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
                    child: GCircularIcon(
                      icon: Iconsax.heart5,
                      color: Colors.red,
                      backgroundColor: Colors.transparent,
                    ),
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
                      'گردنبند',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(
                      height: 3.5,
                    ),
                    BrandTitleWithVerifiedIcon(
                      title: 'رز کوارتز',
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: GProductPriceText(price: '250'),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: GColor.primaryColor2,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(12),
                      bottomLeft: Radius.circular(10),
                    ),
                  ),
                  child: SizedBox(
                    width: 32 * 1.2,
                    height: 32 * 1.2,
                    child: Center(
                      child: Icon(
                        Iconsax.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
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
