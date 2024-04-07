import 'package:flutter/material.dart';
import 'package:gemglow/constants/color-string.dart';
import 'package:gemglow/constants/widgets-page/containers.dart';
import 'package:gemglow/constants/widgets-page/product-price.dart';
import 'package:gemglow/constants/widgets/product-widgets.dart';
import 'package:gemglow/constants/widgets/store-widgets.dart';
import 'package:gemglow/enums.dart';

class ProductMetaData extends StatelessWidget {
  const ProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            RoundedContainer(
              radius: 10,
              backgroundColor: GColor.primaryColor3.withOpacity(0.8),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Text(
                '25%',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: Colors.black),
              ),
            ),
            SizedBox(width: 16),
            Text(
              '250 تومان',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .apply(decoration: TextDecoration.lineThrough),
            ),
            SizedBox(width: 16),
            GProductPriceText(
              price: '175',
              isLarg: true,
            ),
          ],
        ),
        SizedBox(height: 16 / 1.5),
        ProductTitleText(
          title: 'سنگ کوارتز صورتی',
        ),
        SizedBox(height: 16 / 1.5),
        Row(
          children: [
            ProductTitleText(
              title: 'وضعیت',
            ),
            SizedBox(width: 16),
            Text(
              'موجود در انبار',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
        SizedBox(height: 16 / 1.5),
        Row(
          children: [
            CircleImage(
              image: 'assets/png/natural.png',
              width: 32,
              height: 32,
              overlayColor: Colors.black,
            ),
            BrandTitleWithVerifiedIcon(
              title: 'بولگاری',
              brandTextSize: 24,
            ),
          ],
        )
      ],
    );
  }
}
