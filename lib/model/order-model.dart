import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gemglow/data/utils/formatter.dart';
import 'package:gemglow/enums.dart';
import 'package:gemglow/model/cart-item-model.dart';

class OrderModel {
  String id;
  String userId;
  OrderStatus status;
  List<CartItemModel> items;
  double totalAmount;
  DateTime orderDate;
  String paymentMethod;
  String address;
  DateTime deliveryDate;

  OrderModel({
    required this.id,
    required this.userId,
    required this.status,
    required this.items,
    required this.totalAmount,
    required this.orderDate,
    required this.paymentMethod,
    required this.address,
    required this.deliveryDate,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'status': status.toString(),
      'items': items.map((item) => item.toJson()).toList(),
      'totalAmount': totalAmount,
      'orderDate': orderDate.toIso8601String(),
      'paymentMethod': paymentMethod,
      'address': address,
      'deliveryDate': deliveryDate.toIso8601String(),
    };
  }

  factory OrderModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return OrderModel(
      id: data['id'],
      userId: data['userId'],
      status:
          OrderStatus.values.firstWhere((e) => e.toString() == data['status']),
      items: (data['items'] as List)
          .map((item) => CartItemModel.fromJson(item))
          .toList(),
      totalAmount: data['totalAmount'],
      orderDate: DateTime.parse(data['orderDate']),
      paymentMethod: data['paymentMethod'],
      address: data['address'],
      deliveryDate: DateTime.parse(data['deliveryDate']),
    );
  }

  String get formattedDeliveryDate =>
      deliveryDate != null ? GFormatter.formatDate(deliveryDate) : '';

  String get formattedOrderDate => GFormatter.formatDate(orderDate);
}
