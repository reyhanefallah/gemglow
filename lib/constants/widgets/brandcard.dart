import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gemglow/constants/color-string.dart';
import 'package:gemglow/constants/widgets-page/containers.dart';
import 'package:gemglow/constants/widgets/store-widgets.dart';
import 'package:gemglow/enums.dart';

class BrandCard extends StatelessWidget {
  const BrandCard({
    super.key,
    required this.showBorder,
    this.onTap,
  });

  final bool showBorder;
  final void Function()? onTap;

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
                isNetworkImage: false,
                image: 'assets/png/therapy.png',
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
                    title: 'الماس',
                    brandTextSize: TextSizes.large,
                  ),
                  Text(
                    '267 محصول',
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
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      showBorder: true,
      borderColor: GColor.primaryColor2,
      backgroundColor: Colors.transparent,
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          BrandCard(showBorder: false),
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
      child: Image(
        image: AssetImage(image),
        fit: BoxFit.contain,
      ),
    ),
  );
}
