import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:gemglow/data/utils/firebase-auth-exception.dart';
import 'package:gemglow/model/categories-model.dart';
import 'package:get/get.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final snapshot = await _db.collection('Categories').get();
      final list = snapshot.docs
          .map((document) => CategoryModel.fromSnapshot(document))
          .toList();
      return list;
    } on FirebaseAuthException catch (e) {
      throw GFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw GFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw GFormatException();
    } on PlatformException catch (e) {
      throw GPlatformException(e.code).message;
    } catch (e) {
      throw 'مشکلی پیش آمده. دوباره سعی کنید';
    }
  }

  Future<List<CategoryModel>> getSubCategories(String categoryId) async {
    try {
      final snapshot = await _db
          .collection('Categories')
          .where('ParentId', isEqualTo: categoryId)
          .get();
      final result =
          snapshot.docs.map((e) => CategoryModel.fromSnapshot(e)).toList();
      return result;
    } on FirebaseException catch (e) {
      throw GFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw GPlatformException(e.code).message;
    } catch (e) {
      throw 'مشکلی پیش آمده. دوباره سعی کنید';
    }
  }
  // Future<void> uploadDummyData(List<CategoryModel> categories) async {
  //   try {
  //     final storage = Get.put(GFirebaseStorageService());

  //     for (var category in categories) {
  //       final file = await storage.getImageDataFromAssets(category.image);

  //       final url =
  //           await storage.uploadImageData('Categories', file, category.name);

  //       category.image = url;

  //       await _db
  //           .collection("Categories")
  //           .doc(category.id)
  //           .set(category.toJson());
  //     }
  //   } on FirebaseException catch (e) {
  //     throw GFirebaseException(e.code).message;
  //   } on PlatformException catch (e) {
  //     throw GPlatformException(e.code).message;
  //   } catch (e) {
  //     throw 'مشکلی پیش آمده. دوباره سعی کنید';
  //   }
  // }
}
