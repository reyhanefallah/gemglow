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
