import 'package:flutter/material.dart';
import 'package:gemglow/constants/color-string.dart';
import 'package:gemglow/constants/helper-function.dart';
import 'package:gemglow/constants/widgets-page/loader.dart';
import 'package:gemglow/constants/widgets/address-widgets.dart';
import 'package:gemglow/constants/widgets/main-widgates.dart';
import 'package:gemglow/constants/widgets/widgets.dart';
import 'package:gemglow/data/repository/address-repository.dart';
import 'package:gemglow/data/utils/network-manager.dart';
import 'package:gemglow/model/address-model.dart';
import 'package:gemglow/view/add-new-address-screen.dart';
import 'package:get/get.dart';

class AddressController extends GetxController {
  static AddressController get instance => Get.find();

  final name = TextEditingController();
  final phoneNumber = TextEditingController();
  final street = TextEditingController();
  final postalCode = TextEditingController();
  final city = TextEditingController();
  final state = TextEditingController();
  final country = TextEditingController();
  GlobalKey<FormState> addressFormKey = GlobalKey<FormState>();

  final Rx<AddressModel> selectedAddress = AddressModel.empty().obs;
  final addressRepository = Get.put(AddressRepository());
  RxBool refreshData = true.obs;

  Future<List<AddressModel>> getAllUserAddresses() async {
    try {
      final addresses = await addressRepository.fetchUserAddress();
      selectedAddress.value = addresses.firstWhere(
          (element) => element.selectedAddress,
          orElse: () => AddressModel.empty());
      return addresses;
    } catch (e) {
      GLoaders.errorSnackBar(title: 'آدرسی یافت نشد', message: e.toString());
      return [];
    }
  }

  Future selectAddress(AddressModel newSelectedAddress) async {
    try {
      // Get.defaultDialog(
      //   title: '',
      //   onWillPop: () async {
      //     return false;
      //   },
      //   barrierDismissible: false,
      //   backgroundColor: Colors.transparent,
      //   //content: GCircularLoader(),
      // );

      if (selectedAddress.value.id.isNotEmpty) {
        await addressRepository.updateSelectedField(
            selectedAddress.value.id, false);
      }
      newSelectedAddress.selectedAddress = true;
      selectedAddress.value = newSelectedAddress;

      await addressRepository.updateSelectedField(
          selectedAddress.value.id, true);

      Get.back();
    } catch (e) {
      GLoaders.errorSnackBar(title: 'خطا در انتخاب', message: e.toString());
    }
  }

  Future addNewAddresses() async {
    try {
      GFullScreenLoader.openLoadingDialog(
          'ذخیره سازی ادرس...', 'assets/animation/save.json');

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        GFullScreenLoader.stopLoading();
        return;
      }

      if (!addressFormKey.currentState!.validate()) {
        GFullScreenLoader.stopLoading();
        return;
      }

      final address = AddressModel(
        id: '',
        name: name.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        street: street.text.trim(),
        city: city.text.trim(),
        state: state.text.trim(),
        postalCode: postalCode.text.trim(),
        country: country.text.trim(),
        selectedAddress: true,
      );
      final id = await addressRepository.addAddress(address);

      address.id = id;
      await selectedAddress(address);

      GFullScreenLoader.stopLoading();

      GLoaders.successSnackBar(
          title: 'تبریک!', message: 'ادرس با موفقیت ثبت شد');

      refreshData.toggle();

      refreshFormFields();

      Navigator.of(Get.context!).pop();
    } catch (e) {
      GFullScreenLoader.stopLoading();
      GLoaders.errorSnackBar(title: 'ادرس یافت نشد', message: e.toString());
    }
  }

  void refreshFormFields() {
    name.clear();
    phoneNumber.clear();
    street.clear();
    postalCode.clear();
    city.clear();
    state.clear();
    country.clear();
    addressFormKey.currentState?.reset();
  }

  Future<dynamic> selectNewAddressPopup(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (_) => Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionHeading(
              title: 'انتخاب ادرس',
              textColor: Colors.black,
              showActionButton: false,
            ),
            FutureBuilder(
              future: getAllUserAddresses(),
              builder: (_, snapshot) {
                final response = GCloudHelperFunctions.checkMultiRecordState(
                    snapshot: snapshot);
                if (response != null) return response;

                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (_, index) => GSingleAddress(
                    address: snapshot.data![index],
                    onTap: () async {
                      await selectedAddress(snapshot.data![index]);
                      Get.back();
                    },
                  ),
                );
              },
            ),
            SizedBox(height: 16 * 2),
            SizedBox(
              width: double.infinity,
              child: GElevatedButton(
                Gcolor: GColor.primaryColor1,
                Gtitle: 'افزودن ادرس جدید',
                Gstyle: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .apply(color: Colors.white),
                GonPressed: () => Get.to(() => AddNewAddressScreen()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
