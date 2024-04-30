import 'package:flutter/material.dart';
import 'package:gemglow/constants/widgets-page/shimmer.dart';
import 'package:gemglow/constants/widgets/appbar.dart';
import 'package:gemglow/constants/widgets/main-widgates.dart';
import 'package:gemglow/constants/widgets/profile-widgets.dart';
import 'package:gemglow/constants/widgets/store-widgets.dart';
import 'package:gemglow/controller/user-controller.dart';
import 'package:gemglow/view/change-name-screen.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: GAppBar(
        actions: [
          IconButton(
            onPressed: () => Get.back(),
            icon: Icon(Iconsax.arrow_left),
          ),
        ],
        title: Text('مشخصات'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx(() {
                      final networkImage = controller.user.value.profilePicture;
                      final image = networkImage.isNotEmpty
                          ? networkImage
                          : 'assets/png/profile-image.png';
                      return controller.imageUploading.value
                          ? GShimmerEffect(width: 55, height: 55, radius: 80)
                          : CircleImage(
                              image: image,
                              isNetworkImage: networkImage.isNotEmpty);
                    }),
                    TextButton(
                      onPressed: () => controller.uploadUserProfilePicture(),
                      child: Text('تغییر عکس'),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16 / 2,
              ),
              Divider(),
              SizedBox(
                height: 16,
              ),
              SectionHeading(
                title: 'اطلاعات حساب',
                textColor: Colors.black,
                showActionButton: false,
              ),
              SizedBox(
                height: 16,
              ),
              GProfileMenu(
                title: 'نام',
                value: controller.user.value.fullName,
                onPressed: () => Get.to(() => ChangeNameScreen()),
              ),
              GProfileMenu(
                title: 'نام کاربری',
                value: controller.user.value.userName,
                onPressed: () {},
              ),
              SizedBox(
                height: 16,
              ),
              Divider(),
              SizedBox(
                height: 16,
              ),
              SectionHeading(
                title: 'اطلاعات شخصی',
                textColor: Colors.black,
                showActionButton: false,
              ),
              SizedBox(
                height: 16,
              ),
              GProfileMenu(
                title: 'ID کاربر',
                value: controller.user.value.id,
                icon: Iconsax.copy,
                onPressed: () {},
              ),
              GProfileMenu(
                title: 'ایمیل',
                value: controller.user.value.email,
                onPressed: () {},
              ),
              GProfileMenu(
                title: 'شماره تلفن',
                value: controller.user.value.phoneNumber,
                onPressed: () {},
              ),
              GProfileMenu(
                title: 'جنسیت',
                value: 'مرد',
                onPressed: () {},
              ),
              GProfileMenu(
                title: 'تاریخ تولد',
                value: '1373/6/15',
                onPressed: () {},
              ),
              Divider(),
              SizedBox(
                height: 16,
              ),
              Center(
                child: TextButton(
                  onPressed: () => controller.deleteAccountWarningPopup(),
                  child: Text(
                    'حذف حساب کاربری',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
