import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gemglow/constants/color-string.dart';
import 'package:gemglow/view/home-screen.dart';
import 'package:gemglow/view/price-screen.dart';
import 'package:gemglow/view/setting-screen.dart';
import 'package:gemglow/view/store-screen.dart';
import 'package:gemglow/view/wishlist-screen.dart';
import 'package:get/get.dart';

class NavigationBarScreen extends StatelessWidget {
  const NavigationBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    return Scaffold(
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80.0,
          elevation: 0.0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          indicatorColor: GColor.primaryColor1,
          indicatorShape: CircleBorder(),
          destinations: [
            NavigationDestination(
                icon: SvgPicture.asset(
                  'assets/svg/home-icon.svg',
                  height: 35.0,
                  width: 35.0,
                ),
                label: ''),
            NavigationDestination(
                icon: SvgPicture.asset(
                  'assets/svg/shopbag-icon.svg',
                  height: 40.0,
                  width: 40.0,
                ),
                label: ''),
            ////////////////
            NavigationDestination(
                icon: SvgPicture.asset(
                  'assets/png/chart-icon.svg',
                  height: 30.0,
                  width: 30.0,
                  color: Colors.black,
                ),
                label: ''),
            ////////////////
            NavigationDestination(
                icon: SvgPicture.asset(
                  'assets/svg/like-icon.svg',
                  height: 35.0,
                  width: 35.0,
                ),
                label: ''),
            NavigationDestination(
                icon: SvgPicture.asset(
                  'assets/svg/profile-icon.svg',
                  height: 35.0,
                  width: 35.0,
                ),
                label: ''),
          ],
        ),
      ),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screens = [
    HomeScreen(),
    StoreScreen(),
    PriceScreen(),
    WishListScreen(),
    SettingScreen(),
  ];
}
