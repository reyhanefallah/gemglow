import 'package:cloud_firestore/cloud_firestore.dart';

class ReviewModel {
  String id;
  String productId;
  String userId;
  String username;
  String userProfileImage;
  double rating;
  String reviewText;
  DateTime reviewDate;

  ReviewModel({
    required this.id,
    required this.productId,
    required this.userId,
    required this.username,
    required this.userProfileImage,
    required this.rating,
    required this.reviewText,
    required this.reviewDate,
  });

  Map<String, dynamic> toJson() {
    return {
      'ProductId': productId,
      'UserId': userId,
      'Username': username,
      'UserProfileImage': userProfileImage,
      'Rating': rating,
      'ReviewText': reviewText,
      'ReviewDate': reviewDate,
    };
  }

  factory ReviewModel.fromSnapshot(DocumentSnapshot document) {
    final data = document.data() as Map<String, dynamic>;
    return ReviewModel(
      id: document.id,
      productId: data['ProductId'],
      userId: data['UserId'],
      username: data['Username'],
      userProfileImage: data['UserProfileImage'],
      rating: data['Rating'],
      reviewText: data['ReviewText'],
      reviewDate: (data['ReviewDate'] as Timestamp).toDate(),
    );
  }
}
