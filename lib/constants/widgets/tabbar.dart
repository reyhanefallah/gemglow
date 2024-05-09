import 'package:flutter/material.dart';
import 'package:gemglow/constants/color-string.dart';
import 'package:gemglow/constants/helper-function.dart';
import 'package:gemglow/constants/widgets-page/grid-layout.dart';
import 'package:gemglow/constants/widgets-page/product-card-v.dart';
import 'package:gemglow/constants/widgets-page/shimmer.dart';
import 'package:gemglow/constants/widgets/main-widgates.dart';
import 'package:gemglow/controller/category-controller.dart';
import 'package:gemglow/model/categories-model.dart';
import 'package:gemglow/view/all-products-screen.dart';
import 'package:get/get.dart';

class GTabBer extends StatelessWidget implements PreferredSizeWidget {
  const GTabBer({super.key, required this.tabs});

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: TabBar(
        tabs: tabs,
        isScrollable: true,
        indicatorColor: GColor.primaryColor1,
        labelColor: Colors.black,
        unselectedLabelColor: GColor.primaryColor2,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(getAppBarHeight());

  double getAppBarHeight() {
    return kToolbarHeight;
  }
}

//CategoryTab
class CategoryTab extends StatelessWidget {
  const CategoryTab({
    super.key,
    required this.category,
  });

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    //final controller = Get.put(ProductController());
    final controller = CategoryController.instance;

    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              //CategoryBrands(category: category),
              SizedBox(
                height: 15,
              ),
              FutureBuilder(
                  future:
                      controller.getCategoryProducts(categoryId: category.id),
                  builder: (context, snapshot) {
                    final response =
                        GCloudHelperFunctions.checkMultiRecordState(
                            snapshot: snapshot,
                            loader: GVerticalProductShimmer());

                    if (response != null) return response;

                    final products = snapshot.data!;

                    return Column(
                      children: [
                        SectionHeading(
                          title: 'علاقمندی ها',
                          textColor: Colors.black,
                          showActionButton: true,
                          onPressed: () => Get.to(
                            AllProductsScreen(
                              title: category.name,
                              futureMethod: controller.getCategoryProducts(
                                  categoryId: category.id, limit: -1),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        GGridLayout(
                          itemcount: products.length,
                          itembuilder: (_, index) =>
                              GProductCardVertical(product: products[index]),
                        ),
                      ],
                    );
                  }),
            ],
          ),
        ),
      ],
    );
  }
}
