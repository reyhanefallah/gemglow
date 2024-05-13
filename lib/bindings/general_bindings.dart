import 'package:gemglow/controller/address-controller.dart';
import 'package:gemglow/controller/checkout-controller.dart';
import 'package:gemglow/data/utils/network-manager.dart';
import 'package:get/get.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
    Get.put(CheckoutController());
    Get.put(AddressController());

    //Get.put(VariationController());
  }
}
