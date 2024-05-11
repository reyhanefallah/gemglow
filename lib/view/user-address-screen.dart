import 'package:flutter/material.dart';
import 'package:gemglow/constants/color-string.dart';
import 'package:gemglow/constants/helper-function.dart';
import 'package:gemglow/constants/widgets/address-widgets.dart';
import 'package:gemglow/constants/widgets/appbar.dart';
import 'package:gemglow/controller/address-controller.dart';
import 'package:gemglow/view/add-new-address-screen.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressController());

    return Scaffold(
      appBar: GAppBar(
        leadingIcon: IconButton(
          icon: Icon(Iconsax.arrow_right_3),
          onPressed: () => Get.back(),
        ),
        title: Text(
          'ادرس',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Obx(
            () => FutureBuilder(
              key: Key(controller.refreshData.value.toString()),
              future: controller.getAllUserAddresses(),
              builder: (context, snapshot) {
                final response = GCloudHelperFunctions.checkMultiRecordState(
                    snapshot: snapshot);
                if (response != null) return response;

                final addresses = snapshot.data!;

                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: addresses.length,
                  itemBuilder: (_, index) => GSingleAddress(
                    address: addresses[index],
                    onTap: () => controller.selectAddress(addresses[index]),
                  ),
                );
              },
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => AddNewAddressScreen()),
        child: Icon(Iconsax.add, color: Colors.white),
        backgroundColor: GColor.primaryColor1,
      ),
    );
  }
}
