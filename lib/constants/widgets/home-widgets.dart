import 'package:flutter/material.dart';
import 'package:gemglow/constants/widgets-page/shimmer.dart';
import 'package:gemglow/constants/widgets/homewidgets.dart';
import 'package:gemglow/controller/category-controller.dart';
import 'package:gemglow/view/category-product-screen.dart';
import 'package:get/get.dart';

class GHomeCategories extends StatelessWidget {
  const GHomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryController());

    return Obx(() {
      if (categoryController.isLoading.value) return GCategoryShimmer();
      if (categoryController.featuredCategories.isEmpty) {
        return Center(
          child: Text(
            'داده ای یافت نشد',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .apply(color: Colors.white),
          ),
        );
      }
      return SizedBox(
        height: 80.0,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: categoryController.featuredCategories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            final category = categoryController.featuredCategories[index];
            return VerticalCategory(
              backgroundcolor: Colors.white,
              image: category.image,
              title: category.name,
              onTap: () => Get.to(() =>
                  // SubCategoriesScreen(category: category)
                  CategoryProductsScreen(category: category)),
            );
          },
        ),
      );
    });
  }
}
