import 'package:flutter/material.dart';
import 'package:gemglow/constants/helper-function.dart';
import 'package:gemglow/constants/widgets-page/shimmer.dart';
import 'package:gemglow/constants/widgets/brandcard.dart';
import 'package:gemglow/controller/brand-controller.dart';
import 'package:gemglow/model/categories-model.dart';

class CategoryBrands extends StatelessWidget {
  const CategoryBrands({
    super.key,
    required this.category,
  });

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;

    return FutureBuilder(
      future: controller.getBrandsForCategory(category.id),
      builder: (context, snapshot) {
        const loder = Column(
          children: [
            GListTileShimmer(),
            SizedBox(height: 32),
            GBoxesShimmer(),
            SizedBox(height: 32),
          ],
        );

        final widget = GCloudHelperFunctions.checkMultiRecordState(
            snapshot: snapshot, loader: loder);

        if (widget != null) return widget;

        final brands = snapshot.data!;

        return ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: brands.length,
          itemBuilder: (_, index) {
            final brand = brands[index];
            return FutureBuilder(
                future:
                    controller.getBrandProducts(brandId: brand.id, limit: 3),
                builder: (context, snapshot) {
                  final widget = GCloudHelperFunctions.checkMultiRecordState(
                      snapshot: snapshot, loader: loder);

                  if (widget != null) return widget;

                  final products = snapshot.data!;

                  return BrandShowCase(
                    images: products.map((e) => e.thumbnail).toList(),
                    brand: brand,
                  );
                });
          },
        );
      },
    );
  }
}
