import 'package:flutter/material.dart';
import 'package:gemglow/constants/widgets-page/grid-layout.dart';
import 'package:gemglow/constants/widgets/appbar.dart';
import 'package:gemglow/constants/widgets/brandcard.dart';
import 'package:gemglow/constants/widgets/main-widgates.dart';
import 'package:gemglow/view/brand-products-screen.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              GGridLayout(
                itemcount: 8,
                maxextent: 80,
                itembuilder: (context, index) => BrandCard(
                  showBorder: true,
                  onTap: () => Get.to(() => BrandProductsScreen()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
