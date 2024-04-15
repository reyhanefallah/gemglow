import 'package:flutter/material.dart';
import 'package:gemglow/constants/color-string.dart';
import 'package:gemglow/constants/widgets-page/product-card-v.dart';
import 'package:iconsax/iconsax.dart';

class GBottomAddToCart extends StatelessWidget {
  const GBottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16 / 2),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(10),
            topLeft: Radius.circular(10),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              GCircularIcon(
                icon: Iconsax.minus,
                color: Colors.white,
                width: 40,
                height: 40,
                backgroundColor: GColor.primaryColor2,
              ),
              SizedBox(width: 24),
              Text(
                '2',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              SizedBox(width: 24),
              GCircularIcon(
                icon: Iconsax.add,
                color: Colors.white,
                width: 40,
                height: 40,
                backgroundColor: Colors.black,
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(10),
              backgroundColor: Colors.black,
              side: BorderSide(color: Colors.black),
            ),
            child: Text('افزودن به سبد خرید'),
          ),
        ],
      ),
    );
  }
}
