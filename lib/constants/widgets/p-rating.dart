import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gemglow/constants/color-string.dart';
import 'package:iconsax/iconsax.dart';

class GOverallProductRating extends StatelessWidget {
  const GOverallProductRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Text(
            '4.8',
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        Expanded(
          flex: 7,
          child: Column(
            children: [
              GRatingProgressIndicator(text: '5', value: 1.0),
              GRatingProgressIndicator(text: '4', value: 0.8),
              GRatingProgressIndicator(text: '3', value: 0.6),
              GRatingProgressIndicator(text: '2', value: 0.4),
              GRatingProgressIndicator(text: '1', value: 0.2),
            ],
          ),
        )
      ],
    );
  }
}

class GRatingProgressIndicator extends StatelessWidget {
  const GRatingProgressIndicator({
    super.key,
    required this.text,
    required this.value,
  });

  final String text;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        Expanded(
          flex: 11,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: LinearProgressIndicator(
              value: value,
              minHeight: 11,
              backgroundColor: Colors.black26,
              valueColor: AlwaysStoppedAnimation(GColor.primaryColor1),
              borderRadius: BorderRadius.circular(7),
            ),
          ),
        )
      ],
    );
  }
}

class GRatingBarIndicator extends StatelessWidget {
  const GRatingBarIndicator({
    super.key,
    required this.rating,
  });

  final double rating;

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      unratedColor: Colors.black26,
      rating: rating,
      itemSize: 20,
      itemBuilder: (_, __) => Icon(
        Iconsax.star1,
        color: GColor.primaryColor1,
      ),
    );
  }
}
