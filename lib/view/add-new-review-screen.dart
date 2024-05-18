import 'package:flutter/material.dart';
import 'package:gemglow/constants/color-string.dart';
import 'package:gemglow/constants/widgets/widgets.dart';
import 'package:get/get.dart';
import 'package:gemglow/controller/review-controller.dart';
import 'package:gemglow/data/repository/auth-repository.dart';
import 'package:gemglow/model/review-model.dart';

class AddReviewScreen extends StatefulWidget {
  final String productId;

  AddReviewScreen({required this.productId});

  @override
  _AddReviewScreenState createState() => _AddReviewScreenState();
}

class _AddReviewScreenState extends State<AddReviewScreen> {
  final _formKey = GlobalKey<FormState>();
  final _reviewTextController = TextEditingController();
  double _rating = 0.0;

  @override
  Widget build(BuildContext context) {
    final reviewController = Get.put(ReviewController());
    final authController = AuthenticationRepository.instance;

    return Scaffold(
      appBar: AppBar(
        title: Text('ثبت نظر'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _reviewTextController,
                decoration: InputDecoration(labelText: 'نظر شما'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'لطفاً نظر خود را وارد کنید';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              Text('امتیاز شما'),
              Slider(
                value: _rating,
                onChanged: (value) {
                  setState(() {
                    _rating = value;
                  });
                },
                min: 0,
                max: 5,
                divisions: 10,
                label: _rating.toString(),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(24),
        child: GElevatedButton(
            GonPressed: () {
              if (_formKey.currentState!.validate()) {
                final userId = authController.authUser!.uid;
                final userName =
                    authController.authUser!.displayName ?? 'نام کاربر';
                final userImage =
                    authController.authUser!.photoURL ?? 'عکس پروفایل';

                final review = ReviewModel(
                  id: '',
                  productId: widget.productId,
                  userId: userId,
                  username: userName,
                  userProfileImage: userImage,
                  rating: _rating,
                  reviewText: _reviewTextController.text,
                  reviewDate: DateTime.now(),
                );

                reviewController.addReview(review);
                Get.back();
              }
            },
            Gtitle: 'ارسال نظر',
            Gcolor: GColor.primaryColor1,
            Gstyle: Theme.of(context)
                .textTheme
                .bodyMedium!
                .apply(color: Colors.white)),
      ),
    );
  }
}
