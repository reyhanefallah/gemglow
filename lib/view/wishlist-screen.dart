import 'package:flutter/material.dart';
import 'package:gemglow/constants/helper-function.dart';
import 'package:gemglow/constants/widgets-page/animation-loader.dart';
import 'package:gemglow/constants/widgets-page/grid-layout.dart';
import 'package:gemglow/constants/widgets-page/product-card-v.dart';
import 'package:gemglow/constants/widgets-page/shimmer.dart';
import 'package:gemglow/constants/widgets/appbar.dart';
import 'package:gemglow/controller/favourit-controller.dart';
import 'package:gemglow/view/home-screen.dart';
import 'package:gemglow/view/navigation-bar-screen.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = FavouritesController.instance;

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
          // column was here
          child: Obx(
            () => FutureBuilder(
                future: controller.favoriteProducts(),
                builder: (context, snapshot) {
                  final emptyWidget = GAnimationLoaderWidget(
                    text: 'لیست علاقه مندی ها خالی است...',
                    animation: 'assets/png/proccesing.png',
                    showAcction: true,
                    actionText: 'افزودن محصول',
                    onActionPressed: () => Get.off(() => NavigationBarScreen()),
                  );

                  const loder = GVerticalProductShimmer(itemCount: 6);
                  final widget = GCloudHelperFunctions.checkMultiRecordState(
                      snapshot: snapshot,
                      loader: loder,
                      nothingFound: emptyWidget);
                  if (widget != null) return widget;

                  final products = snapshot.data!;

                  return GGridLayout(
                    itemcount: products.length,
                    itembuilder: (_, index) =>
                        GProductCardVertical(product: products[index]),
                  );
                }),
          ),
        ),
      ),
    );
  }
}
