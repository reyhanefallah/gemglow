import 'package:flutter/material.dart';
import 'package:gemglow/constants/widgets-page/grid-layout.dart';
import 'package:gemglow/constants/widgets-page/product-card-v.dart';
import 'package:gemglow/constants/widgets-page/shimmer.dart';
import 'package:gemglow/controller/category-controller.dart';
import 'package:gemglow/model/categories-model.dart';
import 'package:get/get.dart';

class CategoryProductsScreen extends StatelessWidget {
  final CategoryModel category;

  const CategoryProductsScreen({Key? key, required this.category})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CategoryController>();

    return Scaffold(
      appBar: AppBar(
        title: Text(category.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            const SizedBox(height: 15),
            FutureBuilder(
              future: controller.getCategoryProducts(categoryId: category.id),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return GVerticalProductShimmer();
                }

                if (snapshot.hasError ||
                    !snapshot.hasData ||
                    snapshot.data!.isEmpty) {
                  return Center(
                    child: Text(
                      'خطا در دریافت محصولات',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  );
                }

                final products = snapshot.data!;

                return Expanded(
                  child: GGridLayout(
                    itemcount: products.length,
                    itembuilder: (_, index) =>
                        GProductCardVertical(product: products[index]),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
