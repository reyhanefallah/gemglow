import 'package:flutter/material.dart';
import 'package:gemglow/constants/color-string.dart';
import 'package:gemglow/constants/widgets-page/grid-layout.dart';
import 'package:gemglow/constants/widgets-page/product-card-v.dart';
import 'package:gemglow/constants/widgets/appbar.dart';
import 'package:gemglow/controller/product-controller.dart';
import 'package:gemglow/model/product-model.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

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
        backgroundColor: Colors.white,
        appBar: GAppBar(
          leadingIcon: IconButton(
            icon: Icon(Iconsax.arrow_right_3),
            onPressed: () => Get.back(),
          ),
        ),
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: Colors.white,
                //expandedHeight: 440,
                expandedHeight: 85,
                flexibleSpace: Padding(
                  padding: EdgeInsets.all(16),
                  child: SizedBox(
                    height: 50,
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          searchName = value;
                          controller.searchProductsLocally(value);
                        });
                      },
                      decoration: InputDecoration(
                          hintText: 'جست و جو در فروشگاه',
                          prefixIcon: Icon(Iconsax.search_normal),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: GColor.primaryColor2,
                                width: 1,
                              ))),
                    ),
                  ),
                ),
              )
            ];
          },
          body: Obx(() {
            if (controller.isLoading.value) {
              return Center(child: CircularProgressIndicator());
            }

            if (controller.searchResults.isEmpty) {
              return Center(child: Text('محصولی یافت نشد'));
            }

            return Padding(
              padding: const EdgeInsets.all(24.0),
              child: GGridLayout(
                itemcount: controller.searchResults.length,
                itembuilder: (context, index) {
                  return GProductCardVertical(
                      product: controller.searchResults[index]);
                },
              ),
            );
          }),
        ));
  }
}
