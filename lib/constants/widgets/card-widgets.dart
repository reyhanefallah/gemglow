import 'package:flutter/material.dart';
import 'package:gemglow/constants/color-string.dart';
import 'package:gemglow/constants/widgets-page/product-card-v.dart';
import 'package:gemglow/constants/widgets/homewidgets.dart';
import 'package:gemglow/constants/widgets/product-widgets.dart';
import 'package:gemglow/constants/widgets/store-widgets.dart';
import 'package:gemglow/controller/cart-controller.dart';
import 'package:gemglow/enums.dart';
import 'package:gemglow/model/cart-item-model.dart';
import 'package:gemglow/model/product-model.dart';
import 'package:gemglow/view/product-detail-screen.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class GCardItem extends StatelessWidget {
  const GCardItem({
    super.key,
    required this.cartItem,
  });

  final CartItemModel cartItem;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GRoundedImage(
          imageUrl: cartItem.image ?? '',
          width: 60,
          height: 60,
          isNetworkImage: true,
          padding: EdgeInsets.all(8.0),
          backgroundColor: Colors.white,
        ),
        SizedBox(width: 24),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BrandTitleWithVerifiedIcon(title: cartItem.brandName ?? ''),
              Flexible(
                child: ProductTitleText(title: cartItem.title, maxLines: 1),
              ),
              Text.rich(
                TextSpan(
                  children: (cartItem.selectedVariation ?? {})
                      .entries
                      .map(
                        (e) => TextSpan(
                          children: [
                            TextSpan(
                                text: '${e.key}',
                                style: Theme.of(context).textTheme.bodySmall),
                            TextSpan(
                                text: '${e.value}',
                                style: Theme.of(context).textTheme.bodyLarge)
                          ],
                        ),
                      )
                      .toList(),
                  //children: [
                  // TextSpan(
                  //     text: 'رنگ',
                  //     style: Theme.of(context).textTheme.bodySmall),
                  // TextSpan(
                  //     text: 'سیاه',
                  //     style: Theme.of(context).textTheme.bodyLarge),
                  // TextSpan(
                  //     text: 'اندازه',
                  //     style: Theme.of(context).textTheme.bodySmall),
                  // TextSpan(
                  //     text: '5 اینچ',
                  //     style: Theme.of(context).textTheme.bodyLarge),
                  // ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class ProductQuantityWithAddRemoveButton extends StatelessWidget {
  const ProductQuantityWithAddRemoveButton({
    super.key,
    required this.quantity,
    this.add,
    this.remove,
  });

  final int quantity;
  final VoidCallback? add, remove;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        GCircularIcon(
          icon: Iconsax.minus,
          height: 32,
          width: 32,
          size: 10,
          color: Colors.black,
          backgroundColor: Colors.black26,
          onPressed: remove,
        ),
        SizedBox(width: 24),
        Text(quantity.toString(),
            style: Theme.of(context).textTheme.titleSmall),
        SizedBox(width: 24),
        GCircularIcon(
          icon: Iconsax.add,
          height: 32,
          width: 32,
          size: 10,
          color: Colors.white,
          backgroundColor: GColor.primaryColor1,
          onPressed: add,
        ),
      ],
    );
  }
}

class ProductCardAddToCartButton extends StatelessWidget {
  const ProductCardAddToCartButton({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;

    return InkWell(
      onTap: () {
        if (product.productType == ProductType.single.toString()) {
          final cartItem = cartController.convertToCartItem(product, 0);
          cartController.addOneToCart(cartItem);
        } else {
          Get.to(() => ProductDetailScreen(product: product));
        }
      },
      child: Obx(() {
        final productQuantityInCart =
            cartController.getProductQuantityInCart(product.id);

        return Container(
          decoration: BoxDecoration(
            color: productQuantityInCart > 0
                ? GColor.primaryColor1
                : GColor.primaryColor2,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(12),
              bottomLeft: Radius.circular(10),
            ),
          ),
          child: SizedBox(
            width: 32 * 1.2,
            height: 32 * 1.2,
            child: Center(
              child: productQuantityInCart > 0
                  ? Text(productQuantityInCart.toString(),
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .apply(color: Colors.white))
                  : Icon(
                      Iconsax.add,
                      color: Colors.white,
                    ),
            ),
          ),
        );
      }),
    );
  }
}
