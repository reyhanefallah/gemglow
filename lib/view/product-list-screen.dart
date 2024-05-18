// import 'package:flutter/material.dart';
// import 'package:gemglow/constants/widgets-page/product-card-v.dart';
// import 'package:get/get.dart';
// import 'package:gemglow/controller/product-controller.dart';

// class ProductListScreen extends StatelessWidget {
//   final ProductController productController = Get.put(ProductController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Products'),
//       ),
//       body: Obx(() {
//         if (productController.isLoading.value)
//           return Center(child: CircularProgressIndicator());

//         if (productController.featuredProducts.isEmpty) {
//           return Center(
//               child: Text(
//             'داده ای یافت نشد',
//             style: Theme.of(context).textTheme.bodyMedium,
//           ));
//         }

//         return GridView.builder(
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             childAspectRatio: 0.7,
//             crossAxisSpacing: 10,
//             mainAxisSpacing: 10,
//           ),
//           itemCount: productController.featuredProducts.length,
//           itemBuilder: (_, index) {
//             final product = productController.featuredProducts[index];
//             return GProductCardVertical(product: product);
//           },
//         );
//       }),
//     );
//   }
// }
