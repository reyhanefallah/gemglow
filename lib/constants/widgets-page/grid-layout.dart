import 'package:flutter/material.dart';

class GGridLayout extends StatelessWidget {
  const GGridLayout({
    super.key,
    required this.itemcount,
    this.maxextent = 288,
    required this.itembuilder,
  });

  final int itemcount;
  final double? maxextent;
  final Widget? Function(BuildContext, int) itembuilder;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: itemcount,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: maxextent,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16),
      itemBuilder: itembuilder,
    );
  }
}
