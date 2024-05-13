import 'package:gemglow/controller/cart-controller.dart';
import 'package:gemglow/controller/variation-controller.dart';
import 'package:gemglow/data/utils/network-manager.dart';
import 'package:get/get.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
    //Get.put(VariationController());
  }
}
