import 'package:flutter/material.dart';
import 'package:gemglow/constants/widgets/appbar.dart';
import 'package:gemglow/constants/widgets/main-widgates.dart';
import 'package:gemglow/constants/widgets/tabbar.dart';
import 'package:gemglow/controller/brand-controller.dart';
import 'package:gemglow/controller/category-controller.dart';
import 'package:gemglow/view/home-screen.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = CategoryController.instance.featuredCategories;
    final brandController = Get.put(BrandController());

    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: GAppBar(
          title: Text(
            'فروشگاه',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [
            CardCounter(
                // onPressed: () {},
                ),
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: Colors.white,
                //expandedHeight: 440,
                expandedHeight: 150,
                flexibleSpace: Padding(
                  padding: EdgeInsets.all(24),
                  child: ListView(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      GSearchBar(
                        text: 'جستجو در فروشگاه',
                        showborder: true,
                        icon: Iconsax.search_normal,
                        padding: EdgeInsets.zero,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      // SectionHeading(
                      //   title: 'برند ها',
                      //   textColor: Colors.black,
                      //   onPressed: () => Get.to(() => AllBrandsScreen()),
                      //   space: MainAxisAlignment.spaceBetween,
                      // ),
                      // SizedBox(
                      //   height: 24 / 1.5,
                      // ),
                      // Obx(() {
                      //   if (brandController.isLoading.value)
                      //     return GBrandsShimmer();

                      //   if (brandController.featureBrands.isEmpty) {
                      //     return Center(
                      //       child: Text('داده ای یافت نشد!',
                      //           style: Theme.of(context)
                      //               .textTheme
                      //               .bodyMedium!
                      //               .apply(color: Colors.black)),
                      //     );
                      //   }

                      //   return GGridLayout(
                      //     itemcount: brandController.featureBrands.length,
                      //     maxextent: 80,
                      //     itembuilder: (_, index) {
                      //       final brand = brandController.featureBrands[index];

                      //       return BrandCard(
                      //           showBorder: true,
                      //           brand: brand,
                      //           onTap: () => Get.to(
                      //               () => BrandProductsScreen(brand: brand)));
                      //     },
                      //   );
                      // }),
                    ],
                  ),
                ),
                bottom: GTabBer(
                  tabs: categories
                      .map(
                        (Category) => Tab(child: Text(Category.name)),
                      )
                      .toList(),
                ),
              ),
            ];
          },
          body: TabBarView(
              children: categories
                  .map((category) => CategoryTab(category: category))
                  .toList()),
        ),
      ),
    );
  }
}
