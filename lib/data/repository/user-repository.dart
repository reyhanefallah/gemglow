import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:gemglow/model/user-model.dart';
import 'package:get/get.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());
    } on FirebaseException catch (e) {
      throw GFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw GFormatException();
    } on PlatformException catch (e) {
      throw GPlatformException(e.code).message;
    } catch (e) {
      throw 'مشکلی پیش آمده. دوباره امتحان کنید';
    }
  }
}

//write by myself

class GFirebaseException {
  final String message;

  GFirebaseException(this.message);
}

class GFormatException {
  String get message => 'فرمت ورودی نادرست است';
}

class GPlatformException {
  final String code;

  GPlatformException(this.code);

  String get message {
    switch (code) {
      case 'ERROR_OPERATION_NOT_ALLOWED':
        return 'عملیات مجاز نیست';
      case 'ERROR_TOO_MANY_REQUESTS':
        return 'درخواست های بیش از حد';
      case 'ERROR_USER_DISABLED':
        return 'کاربر غیرفعال شده است';
      case 'ERROR_USER_NOT_FOUND':
        return 'کاربر یافت نشد';
      case 'ERROR_INVALID_CREDENTIAL':
        return 'اطلاعات ورودی نادرست است';
      case 'ERROR_WRONG_PASSWORD':
        return 'رمز عبور اشتباه است';
      case 'ERROR_USER_NOT_FOUND':
        return 'کاربر یافت نشد';
      case 'ERROR_EMAIL_ALREADY_IN_USE':
        return 'ایمیل قبلا استفاده شده است';
      case 'ERROR_WEAK_PASSWORD':
        return 'رمز عبور ضعیف است';
      case 'ERROR_INVALID_EMAIL':
        return 'ایمیل نادرست است';
      case 'ERROR_ACCOUNT_EXISTS_WITH_DIFFERENT_CREDENTIAL':
        return 'حساب کاربری با اطلاعات دیگری وجود دارد';
      default:
        return 'خطای ناشناخته رخ داده است';
    }
  }
}
