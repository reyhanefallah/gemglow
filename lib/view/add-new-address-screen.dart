import 'package:flutter/material.dart';
import 'package:gemglow/constants/color-string.dart';
import 'package:gemglow/constants/widgets/appbar.dart';
import 'package:gemglow/constants/widgets/widgets.dart';
import 'package:gemglow/controller/address-controller.dart';
import 'package:gemglow/data/utils/validation.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../constants/text-style.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;

    return Scaffold(
      appBar: GAppBar(
        leadingIcon: IconButton(
          icon: Icon(Iconsax.arrow_right_3),
          onPressed: () => Get.back(),
        ),
        title: Text('افزودن ادرس جدید'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Form(
          key: controller.addressFormKey,
          child: Column(
            children: [
              TextFormField(
                controller: controller.name,
                validator: (value) =>
                    GValidator.validateEmptyText('Name', value),
                decoration: InputDecoration(
                  prefixIcon: Icon(Iconsax.user),
                  labelText: 'نام',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: controller.phoneNumber,
                validator: (value) => GValidator.validatePhoneNumber(value),
                decoration: InputDecoration(
                  prefixIcon: Icon(Iconsax.mobile),
                  labelText: 'شماره تلفن',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: controller.street,
                      validator: (value) =>
                          GValidator.validateEmptyText('Street', value),
                      decoration: InputDecoration(
                        prefixIcon: Icon(Iconsax.building_31),
                        labelText: 'خیابان',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      controller: controller.postalCode,
                      validator: (value) =>
                          GValidator.validateEmptyText('PostalCode', value),
                      decoration: InputDecoration(
                        prefixIcon: Icon(Iconsax.code),
                        labelText: 'کد پستی',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: controller.city,
                      validator: (value) =>
                          GValidator.validateEmptyText('City', value),
                      decoration: InputDecoration(
                        prefixIcon: Icon(Iconsax.building),
                        labelText: 'شهر',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      controller: controller.state,
                      validator: (value) =>
                          GValidator.validateEmptyText('State', value),
                      decoration: InputDecoration(
                        prefixIcon: Icon(Iconsax.activity),
                        labelText: 'منطقه',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: controller.country,
                validator: (value) =>
                    GValidator.validateEmptyText('Country', value),
                decoration: InputDecoration(
                  prefixIcon: Icon(Iconsax.global),
                  labelText: 'کشور',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: GElevatedButton(
                  //  GonPressed: () {},
                  GonPressed: () => controller.addNewAddresses(),
                  Gtitle: 'دخیره',
                  Gcolor: GColor.primaryColor1,
                  Gstyle: GTextStyle.bodyboldSmall,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
