import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gemglow/data/repository/auth-repository.dart';
import 'package:gemglow/model/order-model.dart';
import 'package:get/get.dart';

class OrderRepository extends GetxController {
  static OrderRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<List<OrderModel>> fetchUserOrders() async {
    try {
      final userId = AuthenticationRepository.instance.authUser!.uid;
      if (userId.isEmpty) throw 'اطلاعات کاربر یافت نشد. دوباره امتحان کنید';

      final result =
          await _db.collection('Users').doc(userId).collection('Orders').get();
      return result.docs
          .map((documentSnapshot) => OrderModel.fromSnapshot(documentSnapshot))
          .toList();
    } catch (e) {
      throw 'خطایی در دریافت اطلاعات سفارش رخ داده. دوباره امتحان کنید';
    }
  }

  Future<void> saveOrder(OrderModel order, String userId) async {
    try {
      await _db
          .collection('Users')
          .doc(userId)
          .collection('Orders')
          .add(order.toJson());
    } catch (e) {
      throw 'خطایی در ذخیره اطلاعات سفارش رخ داده. دوباره امتحان کنید';
    }
  }
}
