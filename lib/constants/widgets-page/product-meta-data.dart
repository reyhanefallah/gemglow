import 'package:flutter/material.dart';
import 'package:gemglow/constants/color-string.dart';
import 'package:gemglow/constants/widgets-page/containers.dart';
import 'package:gemglow/constants/widgets-page/product-price.dart';
import 'package:gemglow/constants/widgets/product-widgets.dart';
import 'package:gemglow/constants/widgets/store-widgets.dart';
import 'package:gemglow/controller/product-controller.dart';
import 'package:gemglow/enums.dart';
import 'package:gemglow/model/product-model.dart';

class ProductMetaData extends StatelessWidget {
  const ProductMetaData({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage =
        controller.calculateSalePercentage(product.price, product.salePrice);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            if (salePercentage != null)
              RoundedContainer(
                radius: 10,
                backgroundColor: GColor.primaryColor3.withOpacity(0.8),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: Text(
                  '$salePercentage%',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .apply(color: Colors.black),
                ),
              ),
            SizedBox(width: 16),
            if (product.productType == ProductType.single.toString() &&
                product.salePrice > 0)
              Text(
                '${product.price}',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .apply(decoration: TextDecoration.lineThrough),
              ),
            if (product.productType == ProductType.single.toString() &&
                product.salePrice > 0)
              SizedBox(width: 16),
            GProductPriceText(
              price: controller.getProductPrice(product),
              isLarg: true,
            ),
          ],
        ),
        SizedBox(height: 16 / 1.5),
        ProductTitleText(
          title: product.title,
        ),
        SizedBox(height: 16 / 1.5),
        Row(
          children: [
            ProductTitleText(
              title: 'وضعیت',
            ),
            SizedBox(width: 16),
            Text(
              controller.getProductStockStatus(product.stock),
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
        SizedBox(height: 16 / 1.5),
        Row(
          children: [
            CircleImage(
              image: product.brand != null ? product.brand!.image : '',
              width: 40,
              height: 40,
              overlayColor: Colors.black,
            ),
            BrandTitleWithVerifiedIcon(
              title: product.brand != null ? product.brand!.name : '',
              brandTextSize: 24,
            ),
          ],
        )
      ],
    );
  }
}
