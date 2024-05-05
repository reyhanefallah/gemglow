import 'package:flutter/material.dart';
import 'package:gemglow/constants/widgets-page/grid-layout.dart';
import 'package:gemglow/constants/widgets-page/product-card-v.dart';
import 'package:gemglow/controller/all-products-controller.dart';
import 'package:gemglow/model/product-model.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class GSortableProducts extends StatelessWidget {
  const GSortableProducts({
    super.key,
    required this.products,
  });

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductsController());
    controller.assignProducts(products);

    return Column(
      children: [
        DropdownButtonFormField(
          decoration: InputDecoration(
            prefixIcon: Icon(Iconsax.sort),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.black26),
            ),
          ),
          value: controller.selectedSortOption.value,
          onChanged: (value) {
            controller.sortProducts(value!);
          },
          items: [
            'نام',
            'گران ترین',
            'ارزان ترین',
            'تخفیف دار',
            'جدیدترین',
            //'محبوب ترین'
          ]
              .map((option) => DropdownMenuItem(
                    child: Text(option),
                    value: option,
                  ))
              .toList(),
        ),
        SizedBox(height: 32),
        Obx(
          () => GGridLayout(
              itemcount: controller.products.length,
              itembuilder: (_, index) => GProductCardVertical(
                    product: controller.products[index],
                  )),
        ),
      ],
    );
  }
}
