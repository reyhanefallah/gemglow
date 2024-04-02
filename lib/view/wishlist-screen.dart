import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gemglow/constants/widgets-page/grid-layout.dart';
import 'package:gemglow/constants/widgets-page/product-card-v.dart';
import 'package:gemglow/constants/widgets/appbar.dart';
import 'package:gemglow/view/home-screen.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GAppBar(
        title: Text(
          'whish list',
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
          child: Column(
            children: [
              GGridLayout(
                itemcount: 4,
                itembuilder: (_, index) => GProductCardVertical(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
