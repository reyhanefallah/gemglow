// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:gemglow/model/brand-model.dart';

// class ProductModel {
//   String id;
//   int stock;
//   String? sku;
//   double price;
//   String title;
//   DateTime? date;
//   double salePrice;
//   String thumbnail;
//   bool? isFeatured;
//   BrandModel? brand;
//   String? description;
//   String? categoryId;
//   List<String>? images;
//   String productType;
//   // List<ProductAttributeModel>? productAttributes;
//   // List<ProductVariationModel>? ProductVariation;

//   ProductModel({
//     required this.id,
//     required this.title,
//     required this.stock,
//     required this.price,
//     required this.thumbnail,
//     required this.productType,
//     this.sku,
//     this.brand,
//     this.date,
//     this.images,
//     this.salePrice = 0.0,
//     this.isFeatured,
//     this.categoryId,
//     this.description,
//   });

//   static ProductModel empty() => ProductModel(
//       id: '', title: '', stock: 0, price: 0, thumbnail: '', productType: '');

//   toJson() {
//     return {
//       'SKU': sku,
//       'Title': title,
//       'Stock': stock,
//       'Price': price,
//       'Images': images ?? [],
//       'Thumbnail': thumbnail,
//       'SalePrice': salePrice,
//       'IsFeatured': isFeatured,
//       'CategoryId': categoryId,
//       'Brand': brand!.toJson(),
//       'Description': description,
//       'ProductType': productType,
//       // 'ProductAttributes': productAttributes != null
//       //     ? productAttributes!.map((e) => e.toJson()).toList()
//       //     : [],
//     };
//   }

//   factory ProductModel.fromSnapshot(
//       DocumentSnapshot<Map<String, dynamic>> document) {
//     if (document.data() == null) return ProductModel.empty();
//     final data = document.data()!;
//     return ProductModel(
//       id: document.id,
//       sku: data['SKU'],
//       title: data['Title'],
//       stock: data['Stock'] ?? 0,
//       price: double.parse((data['Price'] ?? 0.0).toString()),
//       isFeatured: data['IsFeatured'] ?? false,
//       salePrice: double.parse((data['SalePrice'] ?? 0.0).toString()),
//       thumbnail: data['Thumbnail'] ?? '',
//       categoryId: data['CategoryId'] ?? '',
//       description: data['Description'] ?? '',
//       productType: data['ProductType'] ?? '',
//       brand: BrandModel.fromJson(data['Brand']),
//       images: data['Images'] != null ? List<String>.from(data['Images']) : [],
//     );
//   }

//   factory ProductModel.fromQuerySnapshot(
//       QueryDocumentSnapshot<Object?> document) {
//     final data = document.data() as Map<String, dynamic>;
//     return ProductModel(
//       id: document.id,
//       sku: data['SKU'] ?? '',
//       title: data['Title'] ?? '',
//       stock: data['Stock'] ?? 0,
//       price: double.parse((data['Price'] ?? 0.0).toString()),
//       isFeatured: data['IsFeatured'] ?? false,
//       salePrice: double.parse((data['SalePrice'] ?? 0.0).toString()),
//       thumbnail: data['Thumbnail'] ?? '',
//       categoryId: data['CategoryId'] ?? '',
//       description: data['Description'] ?? '',
//       productType: data['ProductType'] ?? '',
//       brand: BrandModel.fromJson(data['Brand']),
//       images: data['Images'] != null ? List<String>.from(data['Images']) : [],
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gemglow/model/brand-model.dart';

class ProductModel {
  String id;
  int stock;
  String? sku;
  double price;
  String title;
  DateTime? date;
  double salePrice;
  String thumbnail;
  bool? isFeatured;
  BrandModel? brand;
  String? description;
  String? categoryId;
  List<String>? images;
  String productType;

  ProductModel({
    required this.id,
    required this.title,
    required this.stock,
    required this.price,
    required this.thumbnail,
    required this.productType,
    this.sku,
    this.brand,
    this.date,
    this.images,
    this.salePrice = 0.0,
    this.isFeatured,
    this.categoryId,
    this.description,
  });

  static ProductModel empty() => ProductModel(
      id: '', title: '', stock: 0, price: 0, thumbnail: '', productType: '');

  Map<String, dynamic> toJson() {
    return {
      'SKU': sku,
      'Title': title,
      'Stock': stock,
      'Price': price,
      'Images': images ?? [],
      'Thumbnail': thumbnail,
      'SalePrice': salePrice,
      'IsFeatured': isFeatured,
      'CategoryId': categoryId,
      'Brand': brand?.toJson(),
      'Description': description,
      'ProductType': productType,
    };
  }

  factory ProductModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() == null) return ProductModel.empty();
    final data = document.data()!;
    return ProductModel(
      id: document.id,
      sku: data['SKU'],
      title: data['Title'],
      stock: data['Stock'] ?? 0,
      price: _parseDouble(data['Price']),
      isFeatured: data['IsFeatured'] ?? false,
      salePrice: _parseDouble(data['SalePrice']),
      thumbnail: data['Thumbnail'] ?? '',
      categoryId: data['CategoryId'] ?? '',
      description: data['Description'] ?? '',
      productType: data['ProductType'] ?? '',
      brand: data['Brand'] != null ? BrandModel.fromJson(data['Brand']) : null,
      images: data['Images'] != null ? List<String>.from(data['Images']) : [],
    );
  }

  factory ProductModel.fromQuerySnapshot(
      QueryDocumentSnapshot<Object?> document) {
    final data = document.data() as Map<String, dynamic>;
    return ProductModel(
      id: document.id,
      sku: data['SKU'] ?? '',
      title: data['Title'] ?? '',
      stock: data['Stock'] ?? 0,
      price: _parseDouble(data['Price']),
      isFeatured: data['IsFeatured'] ?? false,
      salePrice: _parseDouble(data['SalePrice']),
      thumbnail: data['Thumbnail'] ?? '',
      categoryId: data['CategoryId'] ?? '',
      description: data['Description'] ?? '',
      productType: data['ProductType'] ?? '',
      brand: data['Brand'] != null ? BrandModel.fromJson(data['Brand']) : null,
      images: data['Images'] != null ? List<String>.from(data['Images']) : [],
    );
  }

  static double _parseDouble(dynamic value) {
    if (value is double) {
      return value;
    } else if (value is int) {
      return value.toDouble();
    } else if (value is String) {
      return double.tryParse(value) ?? 0.0;
    } else {
      return 0.0;
    }
  }
}
