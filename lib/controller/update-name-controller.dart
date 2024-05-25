import 'package:flutter/widgets.dart';
import 'package:gemglow/constants/helper-function.dart';
import 'package:gemglow/constants/widgets-page/loader.dart';
import 'package:gemglow/controller/user-controller.dart';
import 'package:gemglow/data/repository/user-repository.dart';
import 'package:gemglow/data/utils/network-manager.dart';
import 'package:gemglow/view/profile-screen.dart';
import 'package:get/get.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  Future<void> initializeNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async {
    try {
      GFullScreenLoader.openLoadingDialog(
          'اطلاعات در حال بروزرسانی ...', 'assets/animation/loading.json');

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        GFullScreenLoader.stopLoading();
        return;
      }

      if (!updateUserNameFormKey.currentState!.validate()) {
        GFullScreenLoader.stopLoading();
        return;
      }

      Map<String, dynamic> name = {
        'FirstName': firstName.text.trim(),
        'LastName': lastName.text.trim(),
        // 'Username': userName.text.trim(),
      };
      await userRepository.updateSingleField(name);

      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();
      // userController.user.value.userName = userName.text.trim();

      GFullScreenLoader.stopLoading();

      GLoaders.successSnackBar(
          title: 'تبریک!', message: 'اطلاعات شما بروزرسانی شد');

      Get.offAll(() => ProfileScreen());
    } catch (e) {
      GFullScreenLoader.stopLoading();
      GLoaders.errorSnackBar(title: 'خطایی رخ داده', message: e.toString());
    }
  }
}
