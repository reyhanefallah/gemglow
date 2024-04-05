import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gemglow/constants/widgets/appbar.dart';
import 'package:gemglow/constants/widgets/main-widgates.dart';
import 'package:gemglow/constants/widgets/profile-widgets.dart';
import 'package:gemglow/constants/widgets/store-widgets.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                    CircleImage(image: 'assets/png/profile-image.png'),
                    TextButton(
                      onPressed: () {},
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
                value: 'علیرضا',
                onPressed: () {},
              ),
              GProfileMenu(
                title: 'نام کاربری',
                value: 'فلاح',
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
                value: '55731',
                icon: Iconsax.copy,
                onPressed: () {},
              ),
              GProfileMenu(
                title: 'ایمیل',
                value: 'alirezafallah@gmail.com',
                onPressed: () {},
              ),
              GProfileMenu(
                title: 'شماره تلفن',
                value: '+۹۸ 9178466165',
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
                  onPressed: () {},
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
