import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gemglow/constants/color-string.dart';
import 'package:gemglow/constants/widgets-page/containers.dart';
import 'package:gemglow/constants/widgets-page/shimmer.dart';
import 'package:gemglow/constants/widgets/store-widgets.dart';
import 'package:gemglow/enums.dart';
import 'package:gemglow/model/brand-model.dart';
import 'package:gemglow/view/brand-products-screen.dart';
import 'package:get/get.dart';

class BrandCard extends StatelessWidget {
  const BrandCard({
    super.key,
    required this.showBorder,
    this.onTap,
    required this.brand,
  });

  final bool showBorder;
  final void Function()? onTap;
  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: RoundedContainer(
        showBorder: showBorder,
        borderColor: GColor.primaryColor2,
        backgroundColor: Colors.transparent,
        padding: EdgeInsets.all(5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: CircleImage(
                isNetworkImage: true,
                image: brand.image,
                backgroundColor: Colors.transparent,
                overlayColor: Colors.black,
              ),
            ),
            SizedBox(
              width: 24 / 2,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BrandTitleText(
                    title: brand.name,
                    brandTextSize: TextSizes.large,
                  ),
                  Text(
                    '${brand.productCount ?? 0} محصول',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// BrandShowCard
class BrandShowCase extends StatelessWidget {
  const BrandShowCase({
    super.key,
    required this.images,
    required this.brand,
  });

  final List<String> images;
  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => BrandProductsScreen(brand: brand)),
      child: RoundedContainer(
        showBorder: true,
        borderColor: GColor.primaryColor2,
        backgroundColor: Colors.transparent,
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            BrandCard(showBorder: false, brand: brand),
            SizedBox(
              height: 15,
            ),
            Row(
              children: images
                  .map((image) => BrandTopProductImage(image, context))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

Widget BrandTopProductImage(String image, context) {
  return Expanded(
    child: RoundedContainer(
      height: 100,
      backgroundColor: Colors.white,
      margin: EdgeInsets.only(right: 5),
      padding: EdgeInsets.all(5),
      child: CachedNetworkImage(
        imageUrl: image,
        fit: BoxFit.contain,
        progressIndicatorBuilder: (context, url, progress) =>
            GShimmerEffect(width: 100, height: 100),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
    ),
  );
}
