// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:gemglow/data/utils/formatter.dart';
// import 'package:gemglow/enums.dart';
// import 'package:gemglow/model/address-model.dart';
// import 'package:gemglow/model/cart-item-model.dart';

// class OrderModel {
//   final String id;
//   final String userId;
//   final OrderStatus status;
//   final double totalAmount;
//   final DateTime orderDate;
//   final String paymentMethod;
//   final AddressModel? address;
//   final DateTime? deliveryDate;
//   final List<CartItemModel> items;

//   OrderModel({
//     required this.id,
//     this.userId = '',
//     required this.status,
//     required this.items,
//     required this.totalAmount,
//     required this.orderDate,
//     this.paymentMethod = 'بانک ملی',
//     this.address,
//     this.deliveryDate,
//   });

//   // String get formattedOrderDate => GHelperFunctions.getFormattedDate(orderDate);
//   String get formattedOrderDate => GFormatter.formatDate(orderDate);

//   // String get formattedDeliveryDate => deliveryDate != null
//   //     ? GHelperFunctions.getFormattedDate(deliveryDate!)
//   //     : '';
//   String get formattedDeliveryDate =>
//       deliveryDate != null ? GFormatter.formatDate(deliveryDate!) : '';

//   String get orderStatusText => status == OrderStatus.delivered
//       ? 'تحویل داده شده'
//       : status == OrderStatus.shipped
//           ? 'در حال ارسال'
//           : 'در حال پردازش';

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'userId': userId,
//       'status': status,
//       'totalAmount': totalAmount,
//       'orderDate': orderDate,
//       'paymentMethod': paymentMethod,
//       'address': address?.toJson(),
//       'deliveryDate': deliveryDate,
//       'items': items.map((item) => item.toJson()).toList(),
//     };
//   }

//   factory OrderModel.fromSnapshot(DocumentSnapshot snapshot) {
//     final data = snapshot.data() as Map<String, dynamic>;

//     return OrderModel(
//       id: data['id'] as String,
//       userId: data['userId'] as String,
//       status:
//           OrderStatus.values.firstWhere((e) => e.toString() == data['status']),
//       totalAmount: data['totalAmount'] as double,
//       orderDate: (data['orderDate'] as Timestamp).toDate(),
//       paymentMethod: data['paymentMethod'] as String,
//       address: AddressModel.fromMap(data['address'] as Map<String, dynamic>),
//       deliveryDate: data['deliveryDate'] == null
//           ? null
//           : (data['deliveryDate'] as Timestamp).toDate(),
//       items: (data['items'] as List<dynamic>)
//           .map((itemData) =>
//               CartItemModel.fromJson(itemData as Map<String, dynamic>))
//           .toList(),
//     );
//   }
// }

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
