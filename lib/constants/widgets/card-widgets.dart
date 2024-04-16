import 'package:flutter/material.dart';
import 'package:gemglow/constants/color-string.dart';
import 'package:gemglow/constants/widgets-page/product-card-v.dart';
import 'package:gemglow/constants/widgets/homewidgets.dart';
import 'package:gemglow/constants/widgets/product-widgets.dart';
import 'package:gemglow/constants/widgets/store-widgets.dart';
import 'package:iconsax/iconsax.dart';

class GCardItem extends StatelessWidget {
  const GCardItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GRoundedImage(
          imageUrl: 'assets/images/product1.jpg',
          width: 60,
          height: 60,
          padding: EdgeInsets.all(8.0),
          backgroundColor: Colors.white,
        ),
        SizedBox(width: 24),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BrandTitleWithVerifiedIcon(title: 'لویی ویتون'),
              Flexible(
                child:
                    ProductTitleText(title: 'سنگ تورمالین سیاه', maxLines: 1),
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                        text: 'رنگ',
                        style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(
                        text: 'سیاه',
                        style: Theme.of(context).textTheme.bodyLarge),
                    // TextSpan(
                    //     text: 'اندازه',
                    //     style: Theme.of(context).textTheme.bodySmall),
                    // TextSpan(
                    //     text: '5 اینچ',
                    //     style: Theme.of(context).textTheme.bodyLarge),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class ProductQuantityWithAddRemoveButton extends StatelessWidget {
  const ProductQuantityWithAddRemoveButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        GCircularIcon(
          icon: Iconsax.minus,
          height: 32,
          width: 32,
          size: 10,
          color: Colors.black,
          backgroundColor: Colors.black26,
        ),
        SizedBox(width: 24),
        Text('2', style: Theme.of(context).textTheme.titleSmall),
        SizedBox(width: 24),
        GCircularIcon(
          icon: Iconsax.add,
          height: 32,
          width: 32,
          size: 10,
          color: Colors.white,
          backgroundColor: GColor.primaryColor1,
        ),
      ],
    );
  }
}
