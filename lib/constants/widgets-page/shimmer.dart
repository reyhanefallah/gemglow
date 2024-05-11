import 'package:flutter/material.dart';
import 'package:gemglow/constants/widgets-page/grid-layout.dart';
import 'package:shimmer/shimmer.dart';

class GShimmerEffect extends StatelessWidget {
  const GShimmerEffect({
    super.key,
    required this.width,
    required this.height,
    this.radius = 15,
    this.color,
  });

  final double width, height, radius;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
    );
  }
}

class GCategoryShimmer extends StatelessWidget {
  const GCategoryShimmer({
    super.key,
    this.itemCount = 5,
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, __) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GShimmerEffect(width: 55, height: 55, radius: 55),
              SizedBox(height: 32 / 2),
              GShimmerEffect(width: 55, height: 8),
            ],
          );
        },
        separatorBuilder: (_, __) => SizedBox(width: 32),
        itemCount: itemCount,
      ),
    );
  }
}

class GVerticalProductShimmer extends StatelessWidget {
  const GVerticalProductShimmer({
    super.key,
    this.itemCount = 4,
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return GGridLayout(
      itemcount: itemCount,
      itembuilder: (_, __) => SizedBox(
        width: 180,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GShimmerEffect(width: 180, height: 180),
            SizedBox(height: 32),
            GShimmerEffect(width: 160, height: 15),
            SizedBox(height: 32 / 2),
            GShimmerEffect(width: 110, height: 15),
          ],
        ),
      ),
    );
  }
}

class GBrandsShimmer extends StatelessWidget {
  const GBrandsShimmer({
    super.key,
    this.itemCount = 4,
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return GGridLayout(
        maxextent: 80,
        itemcount: itemCount,
        itembuilder: (_, __) => GShimmerEffect(width: 300, height: 80));
  }
}

class GListTileShimmer extends StatelessWidget {
  const GListTileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            GShimmerEffect(width: 50, height: 50, radius: 50),
            SizedBox(width: 32),
            Column(
              children: [
                GShimmerEffect(width: 100, height: 15),
                SizedBox(height: 32 / 2),
                GShimmerEffect(width: 80, height: 12),
              ],
            )
          ],
        )
      ],
    );
  }
}

class GBoxesShimmer extends StatelessWidget {
  const GBoxesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: GShimmerEffect(width: 150, height: 100)),
            SizedBox(width: 32),
            Expanded(child: GShimmerEffect(width: 150, height: 100)),
            SizedBox(width: 32),
            Expanded(child: GShimmerEffect(width: 150, height: 100)),
          ],
        )
      ],
    );
  }
}

class GHorizontalProductShimmer extends StatelessWidget {
  const GHorizontalProductShimmer({
    super.key,
    this.itemCount = 4,
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 32),
      height: 120,
      child: ListView.separated(
        itemBuilder: (_, __) => Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            GShimmerEffect(width: 120, height: 120),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 16 / 2),
                GShimmerEffect(width: 20, height: 20),
              ],
            )
          ],
        ),
        separatorBuilder: (context, index) => SizedBox(width: 16),
        itemCount: itemCount,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
