import 'package:flutter/material.dart';

class GProductPriceText extends StatelessWidget {
  const GProductPriceText({
    super.key,
    this.currentSign = 'تومان',
    required this.price,
    this.maxLine = 1,
    this.isLarg = false,
    this.lineThrough = false,
  });

  final String currentSign, price;
  final int maxLine;
  final bool isLarg;
  final bool lineThrough;

  @override
  Widget build(BuildContext context) {
    return Text(
      price + currentSign,
      maxLines: maxLine,
      overflow: TextOverflow.ellipsis,
      style: isLarg
          ? Theme.of(context).textTheme.bodyMedium!.apply(
              decoration: lineThrough ? TextDecoration.lineThrough : null)
          : Theme.of(context).textTheme.bodyMedium!.apply(
              decoration: lineThrough ? TextDecoration.lineThrough : null),
    );
  }
}
