import 'package:flutter/material.dart';
import 'package:gemglow/constants/helper-function.dart';
import 'package:gemglow/constants/widgets-page/product-card-h.dart';
import 'package:gemglow/constants/widgets-page/shimmer.dart';
import 'package:gemglow/constants/widgets/appbar.dart';
import 'package:gemglow/constants/widgets/homewidgets.dart';
import 'package:gemglow/constants/widgets/main-widgates.dart';
import 'package:gemglow/controller/category-controller.dart';
import 'package:gemglow/model/categories-model.dart';
import 'package:gemglow/view/all-products-screen.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({
    super.key,
    required this.category,
  });

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;

    return Scaffold(
      appBar: GAppBar(
        title: Text(category.name),
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
              GRoundedImage(
                imageUrl: 'assets/images/promobanner1.jpg',
                width: double.infinity,
                applyImageRadius: true,
              ),
              SizedBox(height: 32),
              FutureBuilder(
                future: controller.getSubCategories(category.id),
                builder: (context, snapshot) {
                  const loder = GHorizontalProductShimmer();
                  final widget = GCloudHelperFunctions.checkMultiRecordState(
                      snapshot: snapshot, loader: loder);
                  if (widget != null) return widget;

                  final subCtaegories = snapshot.data!;

                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: subCtaegories.length,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (_, index) {
                      final subCategory = subCtaegories[index];

                      return FutureBuilder(
                        future: controller.getCategoryProducts(
                            categoryId: category.id),
                        builder: (context, snapshot) {
                          final widget =
                              GCloudHelperFunctions.checkMultiRecordState(
                                  snapshot: snapshot, loader: loder);
                          if (widget != null) return widget;

                          final products = snapshot.data!;

                          return Column(
                            children: [
                              SectionHeading(
                                title: subCategory.name,
                                textColor: Colors.black,
                                onPressed: () => Get.to(() => AllProductsScreen(
                                      title: subCategory.name,
                                      futureMethod:
                                          controller.getCategoryProducts(
                                              categoryId: subCategory.id,
                                              limit: -1),
                                    )),
                              ),
                              SizedBox(height: 16 / 2),
                              SizedBox(
                                height: 120,
                                child: ListView.separated(
                                  itemCount: products.length,
                                  scrollDirection: Axis.horizontal,
                                  separatorBuilder: (context, index) =>
                                      SizedBox(width: 16),
                                  itemBuilder: (context, index) =>
                                      GProductCardHorizontal(
                                          product: products[index]),
                                ),
                              ),
                              SizedBox(height: 32),
                            ],
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
