import 'package:flutter/material.dart';
import 'package:gemglow/constants/color-string.dart';
import 'package:gemglow/constants/pricing-calculator.dart';
import 'package:gemglow/constants/widgets-page/containers.dart';
import 'package:gemglow/constants/widgets/main-widgates.dart';
import 'package:gemglow/constants/widgets/widgets.dart';
import 'package:gemglow/controller/address-controller.dart';
import 'package:gemglow/controller/cart-controller.dart';
import 'package:gemglow/controller/checkout-controller.dart';
import 'package:gemglow/model/payment-method-model.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class GCouponCode extends StatelessWidget {
  const GCouponCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      showBorder: true,
      borderColor: Colors.black26,
      backgroundColor: Colors.white,
      padding: EdgeInsets.only(right: 16, top: 8, bottom: 8, left: 8),
      child: Row(
        children: [
          Expanded(
            flex: 7,
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'کد تخفیف دارید؟ اینجا وارد کنید',
                focusedBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                border: InputBorder.none,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: GElevatedButton(
              GonPressed: () {},
              Gtitle: 'اعمال',
              Gcolor: GColor.primaryColor1,
              Gstyle: TextStyle(color: Colors.white),
              isDisabled: true,
            ),
          ),
        ],
      ),
    );
  }
}

class GBillingPaymentSection extends StatelessWidget {
  const GBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CheckoutController());

    return Column(
      children: [
        SectionHeading(
          title: 'روش های پرداخت',
          textColor: Colors.black,
          buttonTitle: 'تغییر',
          onPressed: () => controller.selectPaymentMethod(context),
        ),
        SizedBox(height: 24 / 2),
        // درگاه های بانکی را میداریم
        Obx(
          () => Row(
            children: [
              RoundedContainer(
                width: 60,
                height: 35,
                backgroundColor: Colors.white,
                padding: EdgeInsets.all(8.0),
                child: Image(
                  image:
                      AssetImage(controller.selectedPaymentMethod.value.image),
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(width: 24 / 2),
              Text(controller.selectedPaymentMethod.value.name,
                  style: Theme.of(context).textTheme.bodyLarge),
            ],
          ),
        )
      ],
    );
  }
}

class GBillingAmountSection extends StatelessWidget {
  const GBillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    final subTotal = cartController.totalCartPrice.value;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('هزینه محصول', style: Theme.of(context).textTheme.bodyMedium),
            Text('$subTotal', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        SizedBox(height: 24 / 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('هزینه ارسال', style: Theme.of(context).textTheme.bodyMedium),
            Text('${GPricingCalculator.calculateShippingCost(subTotal, 'IR')}',
                style: Theme.of(context).textTheme.labelLarge),
            //Text('\$40.0', style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
        SizedBox(height: 24 / 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('مالیات', style: Theme.of(context).textTheme.bodyMedium),
            Text('${GPricingCalculator.calculateTax(subTotal, 'IR')}',
                style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
        SizedBox(height: 24 / 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('هزینه کل', style: Theme.of(context).textTheme.bodyMedium),
            Text('${GPricingCalculator.calculatorTotalPrice(subTotal, 'IR')}',
                style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
      ],
    );
  }
}

class GBillingAddressSection extends StatelessWidget {
  const GBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    final addressController = AddressController.instance;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeading(
          title: 'ادرس ارسال',
          textColor: Colors.black,
          buttonTitle: 'تغییر',
          onPressed: () => addressController.selectNewAddressPopup(context),
        ),
        addressController.selectedAddress.value.id.isNotEmpty
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('gemglow', style: Theme.of(context).textTheme.bodyLarge),
                  SizedBox(height: 24),
                  Row(
                    children: [
                      Icon(Icons.phone, color: Colors.grey, size: 16),
                      SizedBox(width: 16),
                      Text('+98 9174588124',
                          style: Theme.of(context).textTheme.bodyMedium),
                    ],
                  ),
                  SizedBox(height: 24),
                  Row(
                    children: [
                      Icon(Icons.location_history,
                          color: Colors.grey, size: 16),
                      SizedBox(width: 16),
                      Text('tehran,tehranpars,tohid street',
                          style: Theme.of(context).textTheme.bodyMedium,
                          softWrap: true),
                    ],
                  )
                ],
              )
            : Text('انتخاب ادرس',
                style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}

class GPaymentTitle extends StatelessWidget {
  const GPaymentTitle({
    super.key,
    required this.paymentMethod,
  });

  final PaymentMethodModel paymentMethod;

  @override
  Widget build(BuildContext context) {
    final controller = CheckoutController.instance;

    return ListTile(
      contentPadding: EdgeInsets.all(0),
      onTap: () {
        controller.selectedPaymentMethod.value = paymentMethod;
        Get.back();
      },
      leading: RoundedContainer(
        width: 60,
        height: 40,
        backgroundColor: Colors.white,
        padding: EdgeInsets.all(8),
        child:
            Image(image: AssetImage(paymentMethod.image), fit: BoxFit.contain),
      ),
      title: Text(paymentMethod.name),
      trailing: Icon(Iconsax.arrow_left_34),
    );
  }
}
