import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gemglow/constants/color-string.dart';
import 'package:gemglow/constants/widgets-page/containers.dart';
import 'package:gemglow/constants/widgets-page/product-card-v.dart';
import 'package:gemglow/constants/widgets-page/product-price.dart';
import 'package:gemglow/constants/widgets/homewidgets.dart';
import 'package:gemglow/constants/widgets/product-widgets.dart';
import 'package:gemglow/constants/widgets/shadow.dart';
import 'package:gemglow/constants/widgets/store-widgets.dart';
import 'package:iconsax/iconsax.dart';

class GProductCardHorizontal extends StatelessWidget {
  const GProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 310,
      padding: EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white10,
      ),
      child: Row(
        children: [
          RoundedContainer(
            height: 120,
            padding: EdgeInsets.all(8),
            backgroundColor: Colors.white,
            child: Stack(
              children: [
                SizedBox(
                  height: 120,
                  width: 120,
                  child: GRoundedImage(
                    imageUrl: 'assets/images/product1.jpg',
                    applyImageRadius: true,
                  ),
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
            width: 172,
            child: Padding(
              padding: const EdgeInsets.only(top: 8, right: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProductTitleText(title: 'سنگ امیتیس', smallSize: true),
                      SizedBox(height: 16 / 2),
                      BrandTitleWithVerifiedIcon(title: 'تیفانی'),
                    ],
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: GProductPriceText(price: '275.0'),
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
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
