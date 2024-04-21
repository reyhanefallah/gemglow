import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:gemglow/view/login-screen.dart';
import 'package:gemglow/view/onboarding-screen.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  // @override
  // void onInit(){
  // }

  screenRedirect() async {
    deviceStorage.writeIfNull('IsFirstTime', true);
    deviceStorage.read('IsFirstTime') != true
        ? Get.offAll(() => LoginScreen())
        : Get.offAll(OnBoardingScreen());
  }

  /********************  email and password sign in  ***********************/

  //email register
  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
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
}

//write by myself

class GFirebaseException {
  final String message;

  GFirebaseException(this.message);
}

class GFirebaseAuthException {
  final String message;

  GFirebaseAuthException(this.message);
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
