import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gemglow/data/repository/auth-repository.dart';
import 'package:gemglow/model/address-model.dart';
import 'package:get/get.dart';

class AddressRepository extends GetxController {
  static AddressRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<List<AddressModel>> fetchUserAddress() async {
    try {
      final userId = AuthenticationRepository.instance.authUser?.uid;
      // nullable
      if (userId!.isEmpty) throw 'اطلاعات کاربر یافت نشد. دوباره امتحان کنید';

      final result = await _db
          .collection('Users')
          .doc(userId)
          .collection('Addresses')
          .get();
      return result.docs
          .map((documentSnapshot) =>
              AddressModel.fromDocumentSnapshot(documentSnapshot))
          .toList();
    } catch (e) {
      throw 'خطایی رخ داده. دوباره امتحان کنید';
    }
  }

  Future<void> updateSelectedField(String addressId, bool selected) async {
    try {
      final userId = AuthenticationRepository.instance.authUser?.uid;
      await _db
          .collection('Users')
          .doc(userId)
          .collection('Addresses')
          .doc(addressId)
          .update({'SelectedAddress': selected});
    } catch (e) {
      throw 'ادرس انتخاب شده بروزرسانی نشد. دوباره امتحان کنید';
    }
  }

  Future<String> addAddress(AddressModel address) async {
    try {
      final userId = AuthenticationRepository.instance.authUser?.uid;
      final currentAddress = await _db
          .collection('Users')
          .doc(userId)
          .collection('Addresses')
          .add(address.toJson());
      return currentAddress.id;
    } catch (e) {
      throw 'خطایی در ذخیره بوجود امده. دوباره تلاش کنید';
    }
  }
}
