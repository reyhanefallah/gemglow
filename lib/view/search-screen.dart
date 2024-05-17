// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:gemglow/constants/widgets-page/grid-layout.dart';
// import 'package:gemglow/constants/widgets-page/product-card-v.dart';
// import 'package:gemglow/constants/widgets/appbar.dart';
// import 'package:gemglow/controller/product-controller.dart';
// import 'package:gemglow/model/product-model.dart';
// import 'package:get/get.dart';

// class SearchScreen extends StatefulWidget {
//   const SearchScreen({
//     super.key,
//     this.product,
//   });

//   final ProductModel? product;

//   @override
//   State<SearchScreen> createState() => _SearchScreenState();
// }

// class _SearchScreenState extends State<SearchScreen> {
//   @override
//   Widget build(BuildContext context) {
//     var searchName = "";
//     final controller = Get.put(ProductController());

//     return Scaffold(
//       appBar: GAppBar(
//         title: TextField(
//           onChanged: (value) {
//             setState(() {
//               searchName = value;
//             });
//           },
//         ),
//       ),
//       body: StreamBuilder<QuerySnapshot>(
//         stream: FirebaseFirestore.instance
//             .collection('Products')
//             .orderBy('Title')
//             .startAt([searchName]).endAt([searchName + "\uf8ff"]).snapshots(),
//         builder: (context, snapshot) {
//           if (snapshot.hasError) return Text('خطایی رخ داده');

//           if (snapshot.connectionState == ConnectionState.waiting)
//             return Text('در حال پردازش');

//           return GGridLayout(
//             itemcount: snapshot.data!.docs.length,
//             itembuilder: (context, index) {
//               var data = snapshot.data!.docs[index];
//               final products = snapshot.data!;

//               return GGridLayout(
//                 itemcount: controller.featuredProducts.length,
//                 itembuilder: (_, index) => GProductCardVertical(
//                     product: controller.featuredProducts[index]),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:gemglow/constants/widgets-page/grid-layout.dart';
import 'package:gemglow/constants/widgets-page/product-card-v.dart';
import 'package:gemglow/constants/widgets/appbar.dart';
import 'package:gemglow/controller/product-controller.dart';
import 'package:gemglow/model/product-model.dart';
import 'package:get/get.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({
    Key? key,
    this.product,
  }) : super(key: key);

  final ProductModel? product;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final controller = Get.put(ProductController());
  var searchName = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GAppBar(
        //یپونه دکمه برگشت .و ذیزان
        title: TextField(
          onChanged: (value) {
            setState(() {
              searchName = value;
              controller.searchProductsLocally(value);
            });
          },
          decoration: InputDecoration(
            hintText: 'جستجو بر اساس عنوان',
          ),
        ),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        if (controller.searchResults.isEmpty) {
          return Center(child: Text('محصولی یافت نشد'));
        }

        return GGridLayout(
          itemcount: controller.searchResults.length,
          itembuilder: (context, index) {
            return GProductCardVertical(
                product: controller.searchResults[index]);
          },
        );
      }),
    );
  }
}
