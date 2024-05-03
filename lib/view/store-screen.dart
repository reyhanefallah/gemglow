import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gemglow/constants/widgets-page/grid-layout.dart';
import 'package:gemglow/constants/widgets/appbar.dart';
import 'package:gemglow/constants/widgets/brandcard.dart';
import 'package:gemglow/constants/widgets/main-widgates.dart';
import 'package:gemglow/constants/widgets/tabbar.dart';
import 'package:gemglow/controller/category-controller.dart';
import 'package:gemglow/view/all-brands-screen.dart';
import 'package:gemglow/view/home-screen.dart';
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
            CardCounter(
              onPressed: () {},
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
                expandedHeight: 440,
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
                      SectionHeading(
                        title: 'برند ها',
                        textColor: Colors.black,
                        onPressed: () => Get.to(() => AllBrandsScreen()),
                        space: MainAxisAlignment.spaceBetween,
                      ),
                      SizedBox(
                        height: 24 / 1.5,
                      ),
                      GGridLayout(
                        itemcount: 4,
                        maxextent: 80,
                        itembuilder: (_, index) {
                          return BrandCard(showBorder: true);
                        },
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
                  // [
                  //   Tab(
                  //     text: 'جواهر',
                  //   ),
                  //   Tab(
                  //     text: 'طبیعی',
                  //   ),
                  //   Tab(
                  //     text: 'درمانی',
                  //   ),
                  //   Tab(
                  //     text: 'مصنوعی',
                  //   ),
                  //   Tab(
                  //     text: 'طبیعی',
                  //   ),
                  // ],
                ),
              ),
            ];
          },
          body: TabBarView(
              children: categories
                  .map((category) => CategoryTab(category: category))
                  .toList()
              // [
              //   CategoryTab(),
              //   CategoryTab(),
              //   CategoryTab(),
              //   CategoryTab(),
              //   CategoryTab(),
              // ],
              ),
        ),
      ),
    );
  }
}
