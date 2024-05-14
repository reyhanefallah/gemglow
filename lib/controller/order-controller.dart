import 'package:flutter/material.dart';
import 'package:gemglow/constants/helper-function.dart';
import 'package:gemglow/constants/widgets-page/loader.dart';
import 'package:gemglow/controller/address-controller.dart';
import 'package:gemglow/controller/cart-controller.dart';
import 'package:gemglow/controller/checkout-controller.dart';
import 'package:gemglow/data/repository/auth-repository.dart';
import 'package:gemglow/data/repository/order-repository.dart';
import 'package:gemglow/enums.dart';
import 'package:gemglow/model/order-model.dart';
import 'package:gemglow/view/navigation-bar-screen.dart';
import 'package:gemglow/view/success-screen.dart';
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

  void processOrder(double totalAmount) async {
    try {
      GFullScreenLoader.openLoadingDialog('در حال پردازش سفارش', '');

      final userId = AuthenticationRepository.instance.authUser!.uid;
      if (userId.isEmpty) return;

      final order = OrderModel(
          id: UniqueKey().toString(),
          userId: userId,
          status: OrderStatus.pending,
          items: cartController.cartItems.toList(),
          totalAmount: totalAmount,
          orderDate: DateTime.now(),
          paymentMethod: checkoutController.selectedPaymentMethod.value.name,
          address: addressController.selectedAddress.value,
          deliveryDate: DateTime.now());

      await orderRepository.saveOrder(order, userId);

      cartController.clearCart();

      Get.off(
        () => SuccessScreen(
            onPressed: () => Get.offAll(() => NavigationBarScreen()),
            image: 'assets/png/check .png',
            title: 'پرداخت با موفقیت انجام شد',
            subtitle: 'محصول به زودی به دست شما می رسد'),
      );
    } catch (e) {
      GLoaders.errorSnackBar(title: 'خطایی رخ داده', message: e.toString());
    }
  }
}
