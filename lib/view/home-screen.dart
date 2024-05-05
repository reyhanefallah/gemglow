import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gemglow/constants/color-string.dart';
import 'package:gemglow/constants/text-style.dart';
import 'package:gemglow/constants/widgets-page/grid-layout.dart';
import 'package:gemglow/constants/widgets-page/product-card-v.dart';
import 'package:gemglow/constants/widgets-page/shimmer.dart';
import 'package:gemglow/constants/widgets/home-widgets.dart';
import 'package:gemglow/constants/widgets/homewidgets.dart';
import 'package:gemglow/constants/widgets/main-widgates.dart';
import 'package:gemglow/constants/widgets/widgets.dart';
import 'package:gemglow/controller/product-controller.dart';
import 'package:gemglow/view/all-products-screen.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PrimaryHeader(
              child: Column(
                children: [
                  GHomeAppBar(),
                  SizedBox(
                    height: 24,
                  ),
                  GSearchBar(
                    text: 'جستجو در فروشگاه',
                    icon: Iconsax.search_normal,
                    onTap: () {},
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      children: [
                        SectionHeading(
                          title: 'دسته بندی ها',
                          showActionButton: false,
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        GHomeCategories(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  PromoSlider(),
                  SizedBox(
                    height: 15,
                  ),
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
                  SectionHeading(
                    title: 'محبوب ترین ها',
                    textColor: Colors.black,
                    showActionButton: true,
                    onPressed: () => Get.to(() => AllProductsScreen(
                          title: 'محبوب ترین ها',
                          query: FirebaseFirestore.instance
                              .collection('Products')
                              .where('IsFeatured', isEqualTo: true)
                              .limit(6),
                          futureMethod: controller.fetchAllFeaturedProducts(),
                        )),
                  ),
                  SizedBox(
                    height: 16,
                  ),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//searchbar
class GSearchBar extends StatelessWidget {
  const GSearchBar({
    super.key,
    required this.text,
    this.icon,
    this.showbackground = true,
    this.showborder = true,
    this.onTap,
    this.padding = const EdgeInsets.symmetric(horizontal: 24.0),
  });

  final String text;
  final IconData? icon;
  final bool showbackground, showborder;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: Container(
          width: MediaQuery.sizeOf(context).width,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: showbackground ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(15),
            border: showborder ? Border.all(color: GColor.primaryColor2) : null,
          ),
          child: Row(
            children: [
              Icon(
                icon,
                color: GColor.primaryColor2,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                text,
                style: GTextStyle.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
