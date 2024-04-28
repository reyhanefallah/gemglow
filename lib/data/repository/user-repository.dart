import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:gemglow/model/user-model.dart';
import 'package:get/get.dart';

// class UserRepository extends GetxController {
//   static UserRepository get instance => Get.find();

//   final FirebaseFirestore _db = FirebaseFirestore.instance;

//   Future<void> saveUserRecord(UserModel user) async {
//     try {
//       await _db.collection("Users").doc(user.id).set(user.toJson());
//     } on FirebaseException catch (e) {
//       throw GFirebaseException(e.code).message;
//     } on FormatException catch (_) {
//       throw GFormatException();
//     } on PlatformException catch (e) {
//       throw GPlatformException(e.code).message;
//     } catch (e) {
//       throw 'مشکلی پیش آمده. دوباره امتحان کنید';
//     }
//   }
// }

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final RxString lastErrorMessage = ''.obs;

  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());
    } on FirebaseException catch (e) {
      lastErrorMessage.value = 'خطای Firebase: ${e.message}';
    } on FormatException {
      lastErrorMessage.value = 'فرمت ورودی نادرست است';
    } on PlatformException catch (e) {
      lastErrorMessage.value = 'خطا در پلتفرم: ${e.message}';
    } catch (e) {
      lastErrorMessage.value = 'مشکلی پیش آمده. دوباره امتحان کنید';
    }
  }
}




// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/services.dart';
// import 'package:gemglow/model/user-model.dart';
// import 'package:get/get.dart';

// class UserRepository extends GetxController {
//   static UserRepository get instance => Get.find();

//   final FirebaseFirestore _db = FirebaseFirestore.instance;
//   final Rx<RxStatus> status = RxStatus.empty().obs;

//   Future<void> saveUserRecord(UserModel user) async {
//     try {
//       status(RxStatus.loading());
//       await _db.collection("Users").doc(user.id).set(user.toJson());
//       status(RxStatus.success());
//     } on FirebaseException catch (e) {
//       status(RxStatus.error('خطای Firebase: ${e.message}'));
//     } on FormatException catch (_) {
//       status(RxStatus.error('خطا در فرمت داده‌ها'));
//     } on PlatformException catch (e) {
//       status(RxStatus.error('خطا در پلتفرم: ${e.message}'));
//     } catch (e) {
//       status(RxStatus.error('مشکلی پیش آمده. دوباره امتحان کنید'));
//     }
//   }
// }
