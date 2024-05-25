import 'package:flutter/material.dart';
import 'package:gemglow/constants/widgets-page/grid-layout.dart';
import 'package:gemglow/constants/widgets-page/shimmer.dart';
import 'package:gemglow/constants/widgets/appbar.dart';
import 'package:gemglow/constants/widgets/brandcard.dart';
import 'package:gemglow/constants/widgets/main-widgates.dart';
import 'package:gemglow/controller/brand-controller.dart';
import 'package:gemglow/view/brand-products-screen.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brandController = BrandController.instance;

    return Scaffold(
      appBar: GAppBar(
        title: Text('برند ها'),
        backarrow: true,
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
              SectionHeading(
                title: 'برند ها',
                textColor: Colors.black,
                showActionButton: false,
              ),
              SizedBox(height: 16),
              Obx(() {
                if (brandController.isLoading.value) return GBrandsShimmer();

                if (brandController.allBrands.isEmpty) {
                  return Center(
                    child: Text('داده ای یافت نشد!',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .apply(color: Colors.white)),
                  );
                }

                return GGridLayout(
                  itemcount: brandController.allBrands.length,
                  maxextent: 80,
                  itembuilder: (_, index) {
                    final brand = brandController.allBrands[index];

                    return BrandCard(
                      showBorder: true,
                      brand: brand,
                      onTap: () =>
                          Get.to(() => BrandProductsScreen(brand: brand)),
                    );
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
