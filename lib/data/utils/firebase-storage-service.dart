import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class GFirebaseStorageService extends GetxController {
  static GFirebaseStorageService get instance => Get.find();

  final _firebaseStorage = FirebaseStorage.instance;

  Future<Uint8List> getImageDataFromAssets(String path) async {
    try {
      final byteData = await rootBundle.load(path);
      final imageData = byteData.buffer
          .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes);
      return imageData;
    } catch (e) {
      throw 'خطا دز پردازش عکس $e';
    }
  }

  Future<String> uploadImageData(
      String path, Uint8List image, String name) async {
    try {
      final ref = _firebaseStorage.ref(path).child(name);
      await ref.putData(image);
      final url = await ref.getDownloadURL();
      return url;
    } catch (e) {
      if (e is FirebaseException) {
        throw ' خطای فایربیس ${e.message}';
      } else if (e is SocketException) {
        throw ' خطای اینترنت ${e.message}';
      } else if (e is PlatformException) {
        throw '${e.message}';
      } else {
        throw 'مشکلی پیش امده دوباره سعی کنید';
      }
    }
  }

  Future<String> uploadImageFile(String path, XFile image) async {
    try {
      final ref = _firebaseStorage.ref(path).child(image.name);
      await ref.putFile(File(image.path));
      final url = await ref.getDownloadURL();
      return url;
    } catch (e) {
      if (e is FirebaseException) {
        throw ' خطای فایربیس ${e.message}';
      } else if (e is SocketException) {
        throw ' خطای اینترنت ${e.message}';
      } else if (e is PlatformException) {
        throw '${e.message}';
      } else {
        throw 'مشکلی پیش امده دوباره سعی کنید';
      }
    }
  }
}
