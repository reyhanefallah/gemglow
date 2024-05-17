import 'package:flutter/material.dart';
import 'package:gemglow/constants/color-string.dart';
import 'package:gemglow/constants/helper-function.dart';
import 'package:gemglow/constants/widgets-page/animation-loader.dart';
import 'package:gemglow/constants/widgets-page/containers.dart';
import 'package:gemglow/controller/order-controller.dart';
import 'package:gemglow/view/navigation-bar-screen.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class GOrderListItems extends StatelessWidget {
  const GOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OrderController());

    return FutureBuilder(
      future: controller.fetchUserOrders(),
      builder: (_, snapshot) {
        final emptyWidget = GAnimationLoaderWidget(
          text: 'سفارشی وجود ندارد',
          animation: 'assets/animation/empty-cart.json',
          showAcction: true,
          actionText: 'سفارش محصول',
          onActionPressed: () => Get.off(() => NavigationBarScreen()),
        );

        final response = GCloudHelperFunctions.checkMultiRecordState(
            snapshot: snapshot, nothingFound: emptyWidget);
        if (response != null) return response;

        final orders = snapshot.data!;

        return ListView.separated(
          itemCount: orders.length,
          shrinkWrap: true,
          separatorBuilder: (_, index) => SizedBox(height: 16),
          itemBuilder: (_, index) {
            final order = orders[index];

            return RoundedContainer(
              showBorder: true,
              borderColor: Colors.black26,
              backgroundColor: Colors.white24,
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Icon(Iconsax.shop),
                            SizedBox(width: 16 / 2),
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    order.orderStatusText,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .apply(
                                            color: GColor.primaryColor1,
                                            fontWeightDelta: 1),
                                  ),
                                  Text(order.formattedOrderDate,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall),
                                ],
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Iconsax.arrow_left_34, size: 16),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Icon(Iconsax.tag),
                            SizedBox(width: 16 / 2),
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'سفارش',
                                    style:
                                        Theme.of(context).textTheme.labelMedium,
                                  ),
                                  Text(order.id,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Icon(Iconsax.calendar),
                            SizedBox(width: 16 / 2),
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'تاریخ ارسال',
                                    style:
                                        Theme.of(context).textTheme.labelMedium,
                                  ),
                                  Text(order.formattedDeliveryDate,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
