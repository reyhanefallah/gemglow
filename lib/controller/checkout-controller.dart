import 'package:flutter/material.dart';
import 'package:gemglow/constants/widgets/checkout-widgets.dart';
import 'package:gemglow/constants/widgets/main-widgates.dart';
import 'package:gemglow/model/payment-method-model.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {
  static CheckoutController get instance => Get.find();

  final Rx<PaymentMethodModel> selectedPaymentMethod =
      PaymentMethodModel.empty().obs;

  @override
  void onInit() {
    selectedPaymentMethod.value = PaymentMethodModel(
        name: 'بانک ملی', image: 'assets/images/logo-bank-melli.jpg');
    super.onInit();
  }

  Future<dynamic> selectPaymentMethod(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (_) => SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionHeading(
                  title: 'درگاه پرداخت را انتخاب کنید',
                  textColor: Colors.black,
                  showActionButton: false),
              SizedBox(height: 32),
              GPaymentTitle(
                paymentMethod: PaymentMethodModel(
                    name: 'بانک ملی',
                    image: 'assets/images/logo-bank-melli.jpg'),
              ),
              SizedBox(height: 16 / 2),
              GPaymentTitle(
                paymentMethod: PaymentMethodModel(
                    name: 'بانک سامان',
                    image: 'assets/images/logo-bank-saman.jpg'),
              ),
              SizedBox(height: 16 / 2),
              GPaymentTitle(
                paymentMethod: PaymentMethodModel(
                    name: 'بانک ملت',
                    image: 'assets/images/logo-bank-melat.jpg'),
              ),
              SizedBox(height: 16 / 2),
            ],
          ),
        ),
      ),
    );
  }
}
