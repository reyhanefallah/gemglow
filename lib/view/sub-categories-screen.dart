import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gemglow/constants/widgets-page/product-card-h.dart';
import 'package:gemglow/constants/widgets/appbar.dart';
import 'package:gemglow/constants/widgets/homewidgets.dart';
import 'package:gemglow/constants/widgets/main-widgates.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GAppBar(
        title: Text('درمانی'),
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
              GRoundedImage(
                imageUrl: 'assets/images/promobanner1.jpg',
                width: double.infinity,
                applyImageRadius: true,
              ),
              SizedBox(height: 32),
              Column(
                children: [
                  SectionHeading(
                    title: 'سنگ های درمانی',
                    textColor: Colors.black,
                    onPressed: () {},
                  ),
                  SizedBox(height: 16 / 2),
                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) => SizedBox(width: 16),
                      itemBuilder: (context, index) => GProductCardHorizontal(),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
