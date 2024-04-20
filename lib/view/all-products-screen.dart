import 'package:flutter/material.dart';
import 'package:gemglow/constants/widgets-page/grid-layout.dart';
import 'package:gemglow/constants/widgets-page/product-card-v.dart';
import 'package:gemglow/constants/widgets/appbar.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AllProductsScreen extends StatelessWidget {
  const AllProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GAppBar(
        title: Text('محبوب ترین محصولات'),
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
              DropdownButtonFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Iconsax.sort),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.black26),
                  ),
                ),
                onChanged: (value) {},
                items: [
                  'نام',
                  'گران ترین',
                  'ارزان ترین',
                  'تخفیف دار',
                  'جدیدترین',
                  'محبوب ترین'
                ]
                    .map((option) => DropdownMenuItem(
                          child: Text(option),
                          value: option,
                        ))
                    .toList(),
              ),
              SizedBox(height: 32),
              GGridLayout(
                  itemcount: 4,
                  itembuilder: (_, index) => GProductCardVertical()),
            ],
          ),
        ),
      ),
    );
  }
}
