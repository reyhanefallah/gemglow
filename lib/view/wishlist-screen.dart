import 'package:flutter/material.dart';
import 'package:gemglow/constants/widgets-page/grid-layout.dart';
import 'package:gemglow/constants/widgets-page/product-card-v.dart';
import 'package:gemglow/constants/widgets-page/shimmer.dart';
import 'package:gemglow/constants/widgets/appbar.dart';
import 'package:gemglow/controller/product-controller.dart';
import 'package:gemglow/view/home-screen.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());

    return Scaffold(
      appBar: GAppBar(
        title: Text(
          'علاقمندی ها',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          GCircularIcon(
            icon: Iconsax.add,
            onPressed: () => Get.to(HomeScreen()),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            children: [
              Obx(() {
                if (controller.isLoading.value)
                  return GVerticalProductShimmer();

                if (controller.featuredProducts.isEmpty) {
                  return Center(
                      child: Text(
                    'داده ای یافت نشد',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ));
                }
                return GGridLayout(
                  itemcount: controller.featuredProducts.length,
                  itembuilder: (_, index) => GProductCardVertical(
                      product: controller.featuredProducts[index]),
                );
              }),
              // GGridLayout(
              //   itemcount: 4,
              //   itembuilder: (_, index) => GProductCardVertical(
              //     product: ProductModel.empty(),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
