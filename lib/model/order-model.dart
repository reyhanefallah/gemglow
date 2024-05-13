import 'package:gemglow/constants/color-helper.dart';
import 'package:gemglow/constants/helper-function.dart';
import 'package:gemglow/enums.dart';
import 'package:gemglow/model/address-model.dart';
import 'package:gemglow/model/cart-item-model.dart';

class OrderModel {
  final String id;
  final String userId;
  final OrderStatus status;
  final double totalAmount;
  final DateTime orderDate;
  final String paymentMethod;
  final AddressModel? address;
  final DateTime? deliveryDate;
  final List<CartItemModel> items;

  OrderModel({
    required this.id,
    this.userId = '',
    required this.status,
    required this.items,
    required this.totalAmount,
    required this.orderDate,
    this.paymentMethod = 'بانک ملی',
    this.address,
    this.deliveryDate,
  });

  String get formattedOrderDate => GHelperFunction.
}
