import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gemglow/constants/color-string.dart';
import 'package:gemglow/constants/widgets/appbar.dart';
import 'package:gemglow/constants/widgets/favourit-icon.dart';
import 'package:gemglow/constants/widgets/homewidgets.dart';
import 'package:gemglow/constants/widgets/widgets.dart';
import 'package:gemglow/controller/images-controller.dart';
import 'package:gemglow/model/product-model.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProductImageSlider extends StatelessWidget {
  const ProductImageSlider({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ImagesController());
    final images = controller.getAllProductImages(product);

    return CurveHome(
      child: Container(
        color: Colors.white,
        child: Stack(
          children: [
            SizedBox(
              height: 400,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Center(
                  child: Obx(() {
                    final image = controller.selectedProductImage.value;
                    return GestureDetector(
                      onTap: () => controller.showEnlargedImage(image),
                      child: CachedNetworkImage(
                        imageUrl: image,
                        progressIndicatorBuilder: (_, __, downloadProgress) =>
                            CircularProgressIndicator(
                          value: downloadProgress.progress,
                          color: GColor.primaryColor1,
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
            Positioned(
              left: 0,
              bottom: 30,
              right: 24,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  separatorBuilder: (_, __) => SizedBox(
                    width: 16,
                  ),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: AlwaysScrollableScrollPhysics(),
                  itemCount: images.length,
                  itemBuilder: (_, index) => Obx(() {
                    final imageSelected =
                        controller.selectedProductImage.value == images[index];
                    return GRoundedImage(
                      width: 80,
                      isNetworkImage: true,
                      backgroundColor: Colors.white,
                      border: Border.all(
                          color: imageSelected
                              ? GColor.primaryColor1
                              : Colors.transparent),
                      padding: EdgeInsets.all(8),
                      imageUrl: images[index],
                      onPressed: () =>
                          controller.selectedProductImage.value = images[index],
                    );
                  }),
                ),
              ),
            ),
            GAppBar(
              backarrow: true,
              actions: [
                IconButton(
                  onPressed: () => Get.back(),
                  icon: Icon(Icons.arrow_forward),
                ),
              ],
              leadingIcon: GFavouriteIcon(productId: product.id),
            ),
          ],
        ),
      ),
    );
  }
}

class RatingAndShare extends StatelessWidget {
  const RatingAndShare({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              Iconsax.star5,
              color: Colors.amber,
              size: 24,
            ),
            SizedBox(
              width: 16 / 2,
            ),
            Text.rich(
              TextSpan(children: [
                TextSpan(
                    text: '5.0', style: Theme.of(context).textTheme.bodyLarge),
                TextSpan(text: '(199)')
              ]),
            ),
          ],
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.share,
            size: 24,
          ),
        ),
      ],
    );
  }
}

class ProductTitleText extends StatelessWidget {
  const ProductTitleText({
    super.key,
    required this.title,
    this.smallSize = false,
    this.maxLines = 2,
    this.textAlign = TextAlign.right,
  });

  final String title;
  final bool smallSize;
  final int maxLines;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: smallSize
          ? Theme.of(context).textTheme.labelLarge
          : Theme.of(context).textTheme.titleSmall,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      textAlign: textAlign,
    );
  }
}
