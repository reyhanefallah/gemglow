import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gemglow/constants/helper-function.dart';
import 'package:gemglow/constants/widgets-page/loader.dart';
import 'package:gemglow/data/repository/auth-repository.dart';
import 'package:gemglow/data/repository/user-repository.dart';
import 'package:gemglow/data/utils/network-manager.dart';
import 'package:gemglow/model/user-model.dart';
import 'package:gemglow/view/login-screen.dart';
import 'package:gemglow/view/re-authenticate-screen.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;

  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  final hidePassword = false.obs;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      if (userCredentials != null) {
        final nameParts =
            UserModel.nameParts(userCredentials.user!.displayName ?? '');
        final username =
            UserModel.generateUsername(userCredentials.user!.displayName ?? '');

        final user = UserModel(
          id: userCredentials.user!.uid,
          firstName: nameParts[0],
          lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
          userName: username,
          email: userCredentials.user!.email ?? '',
          phoneNumber: userCredentials.user!.phoneNumber ?? '',
          profilePicture: userCredentials.user!.photoURL ?? '',
        );

        await userRepository.saveUserRecord(user);
      }
    } catch (e) {
      GLoaders.warningSnackBar(
          title: 'اطلاعات ذخیره نشد',
          message:
              'در ذخیره اطلاعات خطایی رخ داده.از طریق پروفایل اطلاعات را دخیره کنید.');
    }
  }

  void deleteAccountWarningPopup() {
    Get.defaultDialog(
      contentPadding: EdgeInsets.all(16),
      title: 'حذف حساب کاربری',
      middleText: 'ایا از حذف حساب کاربری مطمن هستید؟',
      confirm: ElevatedButton(
        onPressed: () async => deleteUserAccount(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Text('حذف'),
        ),
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red, side: BorderSide(color: Colors.red)),
      ),
      cancel: OutlinedButton(
        onPressed: () => Navigator.of(Get.overlayContext!).pop(),
        child: Text('انصراف'),
      ),
    );
  }

  void deleteUserAccount() async {
    try {
      GFullScreenLoader.openLoadingDialog('در حال پردازش', '');
      final auth = AuthenticationRepository.instance;
      final provider =
          auth.authUser!.providerData.map((e) => e.providerId).first;
      if (provider.isNotEmpty) {
        if (provider == 'google.com') {
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          GFullScreenLoader.stopLoading();
          Get.offAll(() => LoginScreen());
        } else if (provider == 'password') {
          GFullScreenLoader.stopLoading();
          Get.to(() => ReAuthLoginFormScreen());
        }
      }
    } catch (e) {
      GFullScreenLoader.stopLoading();
      GLoaders.warningSnackBar(title: 'خطایی رخ داده', message: e.toString());
    }
  }

  Future<void> reAuthenticateEmailAndPasswordUser() async {
    try {
      GFullScreenLoader.openLoadingDialog('در حال پردازش', '');

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        GFullScreenLoader.stopLoading();
        return;
      }

      if (!reAuthFormKey.currentState!.validate()) {
        GFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance
          .reAuthenticateWuthEmailAndPassword(
              verifyEmail.text.trim(), verifyPassword.text.trim());

      await AuthenticationRepository.instance.deleteAccount();

      GFullScreenLoader.stopLoading();

      Get.offAll(() => LoginScreen());
    } catch (e) {
      GFullScreenLoader.stopLoading();
      GLoaders.warningSnackBar(title: 'خطایی رخ داده', message: e.toString());
    }
  }
}
