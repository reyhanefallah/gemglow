import 'package:flutter/material.dart';
import 'package:gemglow/constants/widgets-page/sortable.dart';
import 'package:gemglow/constants/widgets/appbar.dart';
import 'package:gemglow/constants/widgets/brandcard.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class BrandProductsScreen extends StatelessWidget {
  const BrandProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GAppBar(
        title: Text('تیفانی'),
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
              BrandCard(showBorder: true),
              SizedBox(height: 32),
              GSortableProducts(),
            ],
          ),
        ),
      ),
    );
  }
}
