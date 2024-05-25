import 'package:flutter/material.dart';
import 'package:gemglow/constants/color-string.dart';
import 'package:gemglow/constants/widgets-page/shimmer.dart';
import 'package:gemglow/constants/widgets/appbar.dart';
import 'package:gemglow/constants/widgets/p-rating.dart';
import 'package:gemglow/constants/widgets/store-widgets.dart';
import 'package:gemglow/constants/widgets/widgets.dart';
import 'package:gemglow/controller/review-controller.dart';
import 'package:gemglow/controller/user-controller.dart';
import 'package:gemglow/model/review-model.dart';
import 'package:gemglow/view/add-new-review-screen.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProductReviewsScreen extends StatelessWidget {
  final String productId;

  const ProductReviewsScreen({Key? key, required this.productId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final reviewController = Get.put(ReviewController());

    // Fetch reviews for the product
    reviewController.fetchReviewsForProduct(productId);

    return Scaffold(
        appBar: GAppBar(
          title: Text('نظرات و امتیاز'),
          leadingIcon: IconButton(
            icon: Icon(Iconsax.arrow_right_3),
            onPressed: () => Get.back(),
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(24),
          child: Obx(() {
            if (reviewController.isLoading.value) {
              return Center(child: CircularProgressIndicator());
            }

            if (reviewController.productReviews.isEmpty) {
              return Center(child: Text('هیچ نظری برای این محصول وجود ندارد.'));
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 24),
                ...reviewController.productReviews
                    .map((review) => UserReviewCard(review: review))
                    .toList(),
              ],
            );
          }),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(24.0),
          child: GElevatedButton(
              GonPressed: () =>
                  Get.to(() => AddReviewScreen(productId: productId)),
              Gtitle: 'ثبت نظر',
              Gcolor: GColor.primaryColor1,
              Gstyle: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .apply(color: Colors.white)),
        ));
  }
}

class UserReviewCard extends StatelessWidget {
  final ReviewModel review;

  const UserReviewCard({Key? key, required this.review}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Obx(() {
                  final networkImage = controller.user.value.profilePicture;
                  final image = networkImage.isNotEmpty ? networkImage : '';
                  return controller.imageUploading.value
                      ? GShimmerEffect(width: 55, height: 55, radius: 80)
                      : CircleImage(
                          image: image,
                          fit: BoxFit.cover,
                          width: 50,
                          height: 50,
                          padding: 0.0,
                          isNetworkImage: networkImage.isNotEmpty);
                }),
                SizedBox(width: 16),
                Text(controller.user.value.userName,
                    style: Theme.of(context).textTheme.titleLarge),
              ],
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.more_vert),
            ),
          ],
        ),
        SizedBox(height: 16),
        Row(
          children: [
            GRatingBarIndicator(rating: review.rating),
            SizedBox(width: 16),
            Text(
              review.reviewDate.toString(),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(review.reviewText),
        ),
        SizedBox(height: 32),
      ],
    );
  }
}
