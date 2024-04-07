import 'package:flutter/material.dart';
import 'package:gemglow/constants/color-string.dart';
import 'package:gemglow/constants/widgets-page/product-card-v.dart';
import 'package:gemglow/constants/widgets/appbar.dart';
import 'package:gemglow/constants/widgets/homewidgets.dart';
import 'package:gemglow/constants/widgets/widgets.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProductImageSlider extends StatelessWidget {
  const ProductImageSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
                  child: Image(
                    width: double.infinity,
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/product2.jpg'),
                  ),
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
                  itemCount: 4,
                  itemBuilder: (_, index) => GRoundedImage(
                    width: 80,
                    backgroundColor: Colors.white,
                    border: Border.all(color: GColor.primaryColor1),
                    padding: EdgeInsets.all(8),
                    imageUrl: 'assets/images/product3.jpg',
                  ),
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
              leadingIcon: GCircularIcon(
                icon: Iconsax.heart5,
                color: Colors.red,
              ),
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
