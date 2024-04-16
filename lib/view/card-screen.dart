import 'package:flutter/material.dart';
import 'package:gemglow/constants/color-string.dart';
import 'package:gemglow/constants/widgets-page/product-price.dart';
import 'package:gemglow/constants/widgets/appbar.dart';
import 'package:gemglow/constants/widgets/card-widgets.dart';
import 'package:gemglow/constants/widgets/widgets.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GAppBar(
        leadingIcon: IconButton(
          icon: Icon(Iconsax.arrow_right_3),
          onPressed: () => Get.back(),
        ),
        title:
            Text('سبد خرید', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: ListView.separated(
            shrinkWrap: true,
            separatorBuilder: (_, __) => SizedBox(height: 32),
            itemCount: 4,
            itemBuilder: (_, index) => Column(
              children: [
                GCardItem(),
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 70),
                        ProductQuantityWithAddRemoveButton(),
                      ],
                    ),
                    GProductPriceText(price: '265'),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(24),
        child: GElevatedButton(
          Gcolor: GColor.primaryColor1,
          Gtitle: 'تکمیل خرید \$ 265',
          Gstyle: TextStyle(color: Colors.white),
          GonPressed: () {},
        ),
        // ElevatedButton(
        //   style: ButtonStyle(
        //     backgroundColor: MaterialStatePropertyAll(GColor.primaryColor1),
        //     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        //       RoundedRectangleBorder(
        //         borderRadius: BorderRadius.circular(10),
        //       ),
        //     ),
        //   ),
        //   onPressed: () {},
        //   child: Text(
        //     'تکمیل خرید \$ 265.0',
        //     style: TextStyle(color: Colors.white),
        //   ),
        // ),
      ),
    );
  }
}
