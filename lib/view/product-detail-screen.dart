import 'package:flutter/material.dart';
import 'package:gemglow/constants/widgets-page/bottom_card.dart';
import 'package:gemglow/constants/widgets-page/product-meta-data.dart';
import 'package:gemglow/constants/widgets/main-widgates.dart';
import 'package:gemglow/constants/widgets/product-widgets.dart';
import 'package:gemglow/model/product-model.dart';
import 'package:gemglow/view/product-reviews-screen.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GBottomAddToCart(product: product),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProductImageSlider(product: product),
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  RatingAndShare(),
                  ProductMetaData(product: product),
                  // if (product.productType == ProductType.variable.toString())
                  //   ProductAttributes(product: product),
                  // if (product.productType == ProductType.variable.toString())
                  // SizedBox(height: 32),
                  // GElevatedButton(
                  //   Gcolor: GColor.primaryColor1,
                  //   Gstyle: TextStyle(color: Colors.white),
                  //   GonPressed: () {},
                  //   Gtitle: 'پرداخت',
                  // ),
                  SizedBox(height: 32),
                  SectionHeading(
                    title: 'توضیحات',
                    showActionButton: false,
                    textColor: Colors.black,
                  ),
                  SizedBox(height: 32),
                  ReadMoreText(
                    product.description ?? '',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'نمایش بیشتر',
                    trimExpandedText: 'کمتر',
                    moreStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),
                  Divider(),
                  SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SectionHeading(
                        showActionButton: false,
                        title: 'نظرات(199)',
                        textColor: Colors.black,
                        onPressed: () {},
                      ),
                      IconButton(
                        onPressed: () => Get.to(() => ProductReviewsScreen()),
                        icon: Icon(
                          Iconsax.arrow_left_3,
                          size: 18,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 32),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
