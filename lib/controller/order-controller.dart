import 'package:gemglow/constants/widgets-page/loader.dart';
import 'package:gemglow/controller/address-controller.dart';
import 'package:gemglow/controller/cart-controller.dart';
import 'package:gemglow/controller/checkout-controller.dart';
import 'package:gemglow/data/repository/order-repository.dart';
import 'package:gemglow/model/order-model.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  static OrderController get instance => Get.find();

  final cartController = CartController.instance;
  final addressController = AddressController.instance;
  final checkoutController = CheckoutController.instance;
  final orderRepository = Get.put(OrderRepository());

  Future<List<OrderModel>> fetchUserOrders() async {
    try {
      final userOrders = await orderRepository.fetchUserOrders();
      return userOrders;
    } catch (e) {
      GLoaders.warningSnackBar(
          title: 'خطایی رخ داده. دوباره امتحان کنید', message: e.toString());
      return [];
    }
  }
}
