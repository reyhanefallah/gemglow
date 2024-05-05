import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gemglow/constants/widgets-page/shimmer.dart';
import 'package:gemglow/constants/widgets-page/sortable.dart';
import 'package:gemglow/constants/widgets/appbar.dart';
import 'package:gemglow/constants/widgets/brandcard.dart';
import 'package:gemglow/controller/all-products-controller.dart';
import 'package:gemglow/model/product-model.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class BrandProductsScreen extends StatelessWidget {
  const BrandProductsScreen({
    super.key,
    // required this.title,
    // this.query,
    // this.futureMethod,
  });

  // final String title;
  // final Query? query;
  // final Future<List<ProductModel>>? futureMethod;

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(AllProductsController());

    return Scaffold(
      appBar: GAppBar(
        title: Text('تیفانی'),
        leadingIcon: IconButton(
          icon: Icon(Iconsax.arrow_right_3),
          onPressed: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            children: [
              BrandCard(showBorder: true),
              SizedBox(height: 32),
              // FutureBuilder(
              //     future:
              //         futureMethod ?? controller.fetchProductsByQuery(query),
              //     builder: (context, snapshot) {
              //       const loader = GVerticalProductShimmer();

              //       if (snapshot.connectionState == ConnectionState.waiting) {
              //         return loader;
              //       }

              //       if (!snapshot.hasData ||
              //           snapshot.data == null ||
              //           snapshot.data!.isEmpty) {
              //         return Center(child: Text('داده ای یافت نشد'));
              //       }

              //       if (snapshot.hasError) {
              //         return Center(child: Text('خطایی رخ داده'));
              //       }

              //       final products = snapshot.data!;

              //       return GSortableProducts(products: products);
              //     }),
              // GSortableProducts(),
            ],
          ),
        ),
      ),
    );
  }
}
