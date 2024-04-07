import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gemglow/constants/widgets-page/product-meta-data.dart';
import 'package:gemglow/constants/widgets/product-widgets.dart';
import 'package:iconsax/iconsax.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProductImageSlider(),
            Padding(
              padding: EdgeInsets.only(
                top: 24,
                left: 24,
                bottom: 24,
              ),
              child: Column(
                children: [
                  RatingAndShare(),
                  ProductMetaData(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
