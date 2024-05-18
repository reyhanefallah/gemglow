import 'package:flutter/material.dart';
import 'package:gemglow/constants/color-string.dart';
import 'package:gemglow/constants/pricing-calculator.dart';
import 'package:gemglow/constants/widgets-page/card-items.dart';
import 'package:gemglow/constants/widgets-page/containers.dart';
import 'package:gemglow/constants/widgets-page/loader.dart';
import 'package:gemglow/constants/widgets/appbar.dart';
import 'package:gemglow/constants/widgets/checkout-widgets.dart';
import 'package:gemglow/constants/widgets/widgets.dart';
import 'package:gemglow/controller/cart-controller.dart';
import 'package:gemglow/controller/order-controller.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    final subTotal = cartController.totalCartPrice.value;
    final orderController = Get.put(OrderController());
    final totalAmount = GPricingCalculator.calculatorTotalPrice(subTotal, 'IR');

    return Scaffold(
      appBar: GAppBar(
        leadingIcon: IconButton(
          icon: Icon(Iconsax.arrow_right_3),
          onPressed: () => Get.back(),
        ),
        title:
            Text('سبد خرید', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            children: [
              GCardItems(showAddRemoveButton: false),
              //SizedBox(height: 32),
              //GCouponCode(),
              SizedBox(height: 32),
              RoundedContainer(
                showBorder: true,
                borderColor: Colors.black26,
                padding: EdgeInsets.all(16),
                backgroundColor: Colors.white,
                child: Column(
                  children: [
                    GBillingAmountSection(),
                    SizedBox(height: 24),
                    Divider(),
                    SizedBox(height: 24),
                    GBillingPaymentSection(),
                    SizedBox(height: 24),
                    GBillingAddressSection(),
                    SizedBox(height: 24),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(24),
        child: GElevatedButton(
          Gcolor: GColor.primaryColor1,
          Gtitle: 'تکمیل خرید $totalAmount',
          Gstyle: TextStyle(color: Colors.white),
          GonPressed: subTotal > 0
              ? () => orderController.processOrder(totalAmount)
              : () => GLoaders.warningSnackBar(
                  title: 'سبد خرید خالی است!',
                  message: 'به فروشگاه بروید و محصول به سبد خرید اضافه کنید'),
          // () => Get.to(
          //   () => SuccessScreen(
          //     title: 'پرداخت موفق!',
          //     subtitle: 'محصولات به زودی به دست شما خواهذ رسید',
          //     image: '',
          //     onPressed: () => Get.offAll(() => NavigationBarScreen()),
          //   ),
          // ),
        ),
      ),
    );
  }
}
