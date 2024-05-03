import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gemglow/constants/color-string.dart';
import 'package:gemglow/constants/text-style.dart';
import 'package:gemglow/constants/widgets-page/containers.dart';
import 'package:gemglow/constants/widgets-page/shimmer.dart';
import 'package:gemglow/controller/banner-controller.dart';
import 'package:gemglow/controller/home-controller.dart';
import 'package:get/get.dart';

class GRoundedImage extends StatelessWidget {
  const GRoundedImage({
    super.key,
    this.width,
    this.height,
    required this.imageUrl,
    this.applyImageRadius = true,
    this.border,
    this.backgroundColor = GColor.primaryColor2,
    this.fit = BoxFit.contain,
    this.padding,
    this.isNetworkImage = false,
    this.onPressed,
    this.borderRadius = 10,
  });

  final double? width, height;
  final String imageUrl;
  final bool applyImageRadius;
  final BoxBorder? border;
  final Color backgroundColor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        padding: padding,
        decoration: BoxDecoration(
          border: border,
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: ClipRRect(
          borderRadius: applyImageRadius
              ? BorderRadius.circular(borderRadius)
              : BorderRadius.zero,
          child: Image(
            image: isNetworkImage
                ? NetworkImage(imageUrl)
                : AssetImage(imageUrl) as ImageProvider,
            fit: fit,
          ),
        ),
      ),
    );
  }
}

class VerticalCategory extends StatelessWidget {
  const VerticalCategory({
    super.key,
    required this.image,
    required this.title,
    this.onTap,
    this.backgroundcolor,
  });

  final String image, title;
  final void Function()? onTap;
  final Color? backgroundcolor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Container(
              height: 56.0,
              width: 56.0,
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                //color: Colors.white,
                color: backgroundcolor,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: Image(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 6,
            ),
            Text(
              title,
              style: GTextStyle.displaySmall,
            ),
          ],
        ),
      ),
    );
  }
}

class PromoSlider extends StatelessWidget {
  const PromoSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());
    return Obx(() {
      if (controller.isLoading.value)
        return GShimmerEffect(width: double.infinity, height: 190);

      if (controller.banners.isEmpty) {
        return Center(
          child: Text('داده ای برای نمایش وجود ندارد'),
        );
      } else {
        return Column(
          children: [
            CarouselSlider(
                options: CarouselOptions(
                  viewportFraction: 0.90,
                  onPageChanged: (index, _) =>
                      controller.updatePageIndicator(index),
                ),
                items: controller.banners
                    .map((banner) => GRoundedImage(
                          imageUrl: banner.imageUrl,
                          isNetworkImage: true,
                          onPressed: () => Get.toNamed(banner.targetScreen),
                        ))
                    .toList()),
            SizedBox(
              height: 25.0,
            ),
            Center(
              child: Obx(
                () => Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < controller.banners.length; i++)
                      CircularContainer(
                        width: 20,
                        height: 4,
                        margin: EdgeInsets.only(left: 10),
                        backgroundColor:
                            controller.carousalCurrentIndex.value == i
                                ? GColor.primaryColor1
                                : GColor.primaryColor2,
                      ),
                  ],
                ),
              ),
            )
          ],
        );
      }
    });
  }
}
