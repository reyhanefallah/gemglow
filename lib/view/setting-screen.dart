import 'package:flutter/material.dart';
import 'package:gemglow/constants/widgets/appbar.dart';
import 'package:gemglow/constants/widgets/main-widgates.dart';
import 'package:gemglow/constants/widgets/setting-widgets.dart';
import 'package:gemglow/view/order-screen.dart';
import 'package:gemglow/view/profile-screen.dart';
import 'package:gemglow/view/user-address-screen.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            GPrimaryHeaderContainer(
              child: Column(
                children: [
                  GAppBar(
                    title: Text(
                      'حساب کاربری',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .apply(color: Colors.white),
                    ),
                  ),
                  UserProfileTile(
                    onPressed: () => Get.to(() => ProfileScreen()),
                  ),
                  SizedBox(
                    height: 32.0,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(24),
              child: Column(
                children: [
                  SectionHeading(
                    title: 'تنظیمات حساب کاربری',
                    textColor: Colors.black,
                    showActionButton: false,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  SetteingMenuTile(
                    icon: Iconsax.safe_home,
                    title: 'ادرس من',
                    subtitle: 'تنظیم ادرس ارسال',
                    onTap: () => Get.to(() => UserAddressScreen()),
                  ),
                  SetteingMenuTile(
                      icon: Iconsax.shopping_cart,
                      title: 'کارت من',
                      subtitle: 'اضافه حذف محصول ',
                      onTap: () {}),
                  SetteingMenuTile(
                    icon: Iconsax.bag_tick,
                    title: 'سفارشات من',
                    subtitle: 'در حال بررسی یا تکمیل شده',
                    onTap: () => Get.to(() => OrderScreen()),
                  ),
                  SetteingMenuTile(
                      icon: Iconsax.bank,
                      title: 'بانک من',
                      subtitle: 'پرداخت',
                      onTap: () {}),
                  SetteingMenuTile(
                      icon: Iconsax.discount_shape,
                      title: 'تخفیفات من',
                      subtitle: 'لیستی از تخفیفات',
                      onTap: () {}),
                  SetteingMenuTile(
                      icon: Iconsax.notification,
                      title: 'نوتیفیکیشن من',
                      subtitle: 'تنظیم نوتیف پیام ها',
                      onTap: () {}),
                  SetteingMenuTile(
                      icon: Iconsax.security_card,
                      title: 'امنیت حساب',
                      subtitle: 'مدیریت حساب ',
                      onTap: () {}),
                  SizedBox(
                    height: 24,
                  ),
                  SectionHeading(
                    title: 'تنظیمات برنامه',
                    textColor: Colors.black,
                    showActionButton: false,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  SetteingMenuTile(
                      icon: Iconsax.document_upload,
                      title: 'بارگداری داده',
                      subtitle: 'داده ها را در فایربیس ذخیره سازی کنید'),
                  SetteingMenuTile(
                    icon: Iconsax.location,
                    title: 'موقیعت جغرافیایی',
                    subtitle: 'تنظیم موقعیت جغرافیایی',
                    trailing: Switch(value: true, onChanged: (value) {}),
                  ),
                  SetteingMenuTile(
                    icon: Iconsax.security_user,
                    title: 'حالت امن',
                    subtitle: 'جست و جو برای تمام سنین',
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),
                  SetteingMenuTile(
                    icon: Iconsax.image,
                    title: 'کیفیت HD',
                    subtitle: 'تنظیم کیفیت عکس',
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: OutlinedButton(
                      child: Text('خروج از حساب کاربری'),
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(
                    height: 24 * 2.5,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
