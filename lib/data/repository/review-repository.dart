import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:gemglow/model/review-model.dart';

class ReviewRepository extends GetxController {
  static ReviewRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<ReviewModel>> getReviewsForProduct(String productId) async {
    try {
      final snapshot = await _db
          .collection('Reviews')
          .where('ProductId', isEqualTo: productId)
          .get();
      return snapshot.docs.map((doc) => ReviewModel.fromSnapshot(doc)).toList();
    } catch (e) {
      throw Exception('Failed to load reviews');
    }
  }

  Future<void> addReview(ReviewModel review) async {
    try {
      await _db.collection('Reviews').add(review.toJson());
    } catch (e) {
      throw Exception('Failed to add review');
    }
  }
}
