import 'package:flutter/material.dart';
import 'package:gemglow/constants/color-string.dart';
import 'package:gemglow/constants/widgets-page/containers.dart';
import 'package:gemglow/constants/widgets-page/product-price.dart';
import 'package:gemglow/constants/widgets/main-widgates.dart';
import 'package:gemglow/constants/widgets/p-attributes.dart';
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
              // SizedBox(height: 8),
              // ProductTitleText(
              //   title: 'توضیحات محصول در این قسمت قرار میگیرد حداکثر ۴ خط',
              //   smallSize: true,
              //   maxLines: 4,
              // ),
            ],
          ),
        ),
        // SizedBox(height: 24),
        // Column(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     SectionHeading(
        //       title: 'رنگبندی',
        //       textColor: Colors.black,
        //       showActionButton: false,
        //     ),
        //     SizedBox(height: 24 / 2),
        //     Wrap(
        //       spacing: 8,
        //       children: [
        //         GChioceChip(
        //             text: 'سبز', selected: true, onSelected: (value) {}),
        //         GChioceChip(
        //             text: 'آبی', selected: false, onSelected: (value) {}),
        //         GChioceChip(
        //             text: 'قرمز', selected: false, onSelected: (value) {}),
        //       ],
        //     )
        //   ],
        // ),
        // Column(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     SectionHeading(
        //       title: 'اندازه',
        //       textColor: Colors.black,
        //       showActionButton: false,
        //     ),
        //     SizedBox(height: 24 / 2),
        //     Wrap(
        //       spacing: 8,
        //       children: [
        //         GChioceChip(
        //             text: '10 inch', selected: true, onSelected: (value) {}),
        //         GChioceChip(
        //             text: '15 inch', selected: false, onSelected: (value) {}),
        //         GChioceChip(
        //             text: '20 inch', selected: false, onSelected: (value) {}),
        //       ],
        //     )
        //   ],
        // ),
      ],
    );
  }
}
