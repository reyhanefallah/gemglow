import 'package:flutter/material.dart';
import 'package:gemglow/constants/color-string.dart';
import 'package:lottie/lottie.dart';

class GAnimationLoaderWidget extends StatelessWidget {
  const GAnimationLoaderWidget({
    super.key,
    required this.text,
    required this.animation,
    this.showAcction = false,
    this.actionText,
    this.onActionPressed,
  });

  final String text;
  final String animation;
  final bool showAcction;
  final String? actionText;
  final VoidCallback? onActionPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(animation,
              width: MediaQuery.of(context).size.width * 0.8),
          SizedBox(height: 16),
          Text(text,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center),
          SizedBox(height: 16),
          showAcction
              ? SizedBox(
                  width: 250,
                  child: OutlinedButton(
                    onPressed: onActionPressed,
                    style: OutlinedButton.styleFrom(
                        backgroundColor: GColor.primaryColor1),
                    child: Text(
                      actionText!,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .apply(color: Colors.white),
                    ),
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
