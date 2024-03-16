import 'package:flutter/material.dart';
import 'package:gemglow/constants/color-string.dart';
import 'package:gemglow/constants/image-strings.dart';
import 'package:gemglow/constants/widgets-page/containers.dart';
import 'package:gemglow/constants/widgets-page/product-price.dart';
import 'package:gemglow/constants/widgets/homewidgets.dart';
import 'package:gemglow/constants/widgets/shadow.dart';
import 'package:iconsax/iconsax.dart';

class GProductCardVertical extends StatelessWidget {
  const GProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
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
                    top: 0,
                    left: 0,
                    child: RoundedContainer(
                      radius: 10,
                      backgroundColor: GColor.primaryColor3.withOpacity(0.8),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      child: Text(
                        '25%',
                        style: TextStyle(color: Colors.black, fontSize: 12),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: GCircularIcon(
                      icon: Iconsax.heart5,
                      color: Colors.red,
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
            Column(
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
                Row(
                  children: [
                    Text(
                      'رز کوارتز',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(fontSize: 12),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Iconsax.verify5,
                      color: GColor.primaryColor1,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GProductPriceText(price: '250'),
                    // Text(
                    //   '250',
                    //   overflow: TextOverflow.ellipsis,
                    //   maxLines: 1,
                    //   textDirection: TextDirection.rtl,
                    //   style: TextStyle(fontSize: 16),
                    // ),
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
            )
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
        color: Colors.white.withOpacity(0.9),
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
