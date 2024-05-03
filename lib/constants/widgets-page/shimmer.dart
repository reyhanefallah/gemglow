import 'package:flutter/material.dart';
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
