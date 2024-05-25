import 'package:flutter/material.dart';
import 'package:gemglow/constants/color-string.dart';
import 'package:gemglow/constants/widgets-page/containers.dart';
import 'package:gemglow/constants/widgets-page/product-price.dart';
import 'package:gemglow/constants/widgets/main-widgates.dart';
import 'package:gemglow/constants/widgets/product-widgets.dart';
import 'package:gemglow/controller/product-controller.dart';
import 'package:gemglow/model/product-model.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({
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
      children: [
        RoundedContainer(
          backgroundColor: GColor.primaryColor2,
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  SectionHeading(
                    title: 'توضیحات',
                    showActionButton: false,
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          ProductTitleText(
                            title: 'قیمت: ',
                            smallSize: true,
                          ),
                          Text(
                            '${product.price.toString()} تومان',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                          SizedBox(width: 8),
                          GProductPriceText(
                              price: '${controller.getProductPrice(product)}'),
                        ],
                      ),
                      Row(
                        children: [
                          ProductTitleText(
                            title: 'موجود: ',
                            smallSize: true,
                          ),
                          Text(
                            controller.getProductStockStatus(product.stock),
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
