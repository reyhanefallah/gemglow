import 'package:flutter/material.dart';
import 'package:gemglow/constants/widgets-page/grid-layout.dart';
import 'package:gemglow/constants/widgets-page/product-card-v.dart';
import 'package:iconsax/iconsax.dart';

class GSortableProducts extends StatelessWidget {
  const GSortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
            itemcount: 4, itembuilder: (_, index) => GProductCardVertical()),
      ],
    );
  }
}
