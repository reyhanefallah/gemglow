import 'package:flutter/material.dart';
import 'package:gemglow/constants/widgets/appbar.dart';
import 'package:gemglow/constants/widgets/main-widgates.dart';
import 'package:gemglow/constants/widgets/tabbar.dart';
import 'package:gemglow/controller/brand-controller.dart';
import 'package:gemglow/controller/category-controller.dart';
import 'package:gemglow/view/home-screen.dart';
import 'package:gemglow/view/search-screen.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = CategoryController.instance.featuredCategories;

    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: GAppBar(
          title: Text(
            'فروشگاه',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [
            CardCounter(),
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
                        onTap: () => Get.to(() => SearchScreen()),
                      ),
                      SizedBox(
                        height: 15,
                      ),
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
