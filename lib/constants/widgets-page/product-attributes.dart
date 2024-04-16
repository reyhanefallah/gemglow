import 'package:flutter/material.dart';
import 'package:gemglow/constants/color-string.dart';
import 'package:gemglow/constants/widgets-page/containers.dart';
import 'package:gemglow/constants/widgets-page/product-price.dart';
import 'package:gemglow/constants/widgets/main-widgates.dart';
import 'package:gemglow/constants/widgets/p-attributes.dart';
import 'package:gemglow/constants/widgets/product-widgets.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
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
                    title: 'variation',
                    showActionButton: false,
                  ),
                  SizedBox(width: 24),
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
                            '250 تومان',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                          SizedBox(width: 24),
                          GProductPriceText(price: '175'),
                        ],
                      ),
                      Row(
                        children: [
                          ProductTitleText(
                            title: 'موجود: ',
                            smallSize: true,
                          ),
                          Text(
                            'موجود در انبار',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              ProductTitleText(
                title: 'توضیحات محصول در این قسمت قرار میگیرد حداکثر ۴ خط',
                smallSize: true,
                maxLines: 4,
              ),
            ],
          ),
        ),
        SizedBox(height: 24),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionHeading(
              title: 'رنگبندی',
              textColor: Colors.black,
              showActionButton: false,
            ),
            SizedBox(height: 24 / 2),
            Wrap(
              spacing: 8,
              children: [
                GChioceChip(
                    text: 'سبز', selected: true, onSelected: (value) {}),
                GChioceChip(
                    text: 'آبی', selected: false, onSelected: (value) {}),
                GChioceChip(
                    text: 'قرمز', selected: false, onSelected: (value) {}),
              ],
            )
          ],
        ),
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
