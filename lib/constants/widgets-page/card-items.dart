import 'package:flutter/material.dart';
import 'package:gemglow/constants/widgets-page/product-price.dart';
import 'package:gemglow/constants/widgets/card-widgets.dart';

class GCardItems extends StatelessWidget {
  const GCardItems({
    super.key,
    this.showAddRemoveButton = true,
  });

  final bool showAddRemoveButton;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (_, __) => SizedBox(height: 32),
      itemCount: 4,
      itemBuilder: (_, index) => Column(
        children: [
          GCardItem(),
          if (showAddRemoveButton) SizedBox(height: 24),
          if (showAddRemoveButton)
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
    );
  }
}
