// import 'package:get/get.dart';
// import 'package:gemglow/data/repository/review-repository.dart';
// import 'package:gemglow/model/review-model.dart';

// class ReviewController extends GetxController {
//   static ReviewController get instance => Get.find();

//   final isLoading = false.obs;
//   final reviewRepository = Get.put(ReviewRepository());
//   RxList<ReviewModel> productReviews = <ReviewModel>[].obs;

//   Future<void> fetchReviewsForProduct(String productId) async {
//     try {
//       isLoading.value = true;
//       final reviews = await reviewRepository.getReviewsForProduct(productId);
//       productReviews.assignAll(reviews);
//     } catch (e) {
//       Get.snackbar('Error', e.toString());
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   Future<void> addReview(ReviewModel review) async {
//     try {
//       await reviewRepository.addReview(review);
//       productReviews.add(review);
//     } catch (e) {
//       Get.snackbar('Error', e.toString());
//     }
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gemglow/data/repository/review-repository.dart';
import 'package:get/get.dart';
import 'package:gemglow/data/repository/auth-repository.dart';
import 'package:gemglow/model/review-model.dart';

class ReviewController extends GetxController {
  static ReviewController get instance => Get.find();
  final _db = FirebaseFirestore.instance;
  final isLoading = false.obs;
  final reviewRepository = Get.put(ReviewRepository());
  RxList<ReviewModel> productReviews = <ReviewModel>[].obs;

  Future<void> addReview(ReviewModel review) async {
    try {
      final newReviewRef = _db.collection('Reviews').doc();
      review.id = newReviewRef.id;
      await newReviewRef.set(review.toJson());
      Get.snackbar('موفقیت', 'نظر شما با موفقیت ثبت شد');
    } catch (e) {
      Get.snackbar('خطا', 'خطایی در ثبت نظر رخ داده است');
    }
  }

  Future<void> deleteReview(String reviewId) async {
    try {
      await _db.collection('Reviews').doc(reviewId).delete();
      Get.snackbar('موفقیت', 'نظر شما با موفقیت حذف شد');
    } catch (e) {
      Get.snackbar('خطا', 'خطایی در حذف نظر رخ داده است');
    }
  }

  Future<void> fetchReviewsForProduct(String productId) async {
    try {
      isLoading.value = true;
      final reviews = await reviewRepository.getReviewsForProduct(productId);
      productReviews.assignAll(reviews);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
