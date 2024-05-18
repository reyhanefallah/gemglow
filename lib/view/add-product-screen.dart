// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:gemglow/model/brand-model.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:gemglow/constants/widgets-page/loader.dart';
// import 'package:gemglow/controller/product-controller.dart';
// import 'package:gemglow/model/product-model.dart';
// import 'package:firebase_storage/firebase_storage.dart';

// class AddProductScreen extends StatefulWidget {
//   @override
//   _AddProductScreenState createState() => _AddProductScreenState();
// }

// class _AddProductScreenState extends State<AddProductScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final titleController = TextEditingController();
//   final descriptionController = TextEditingController();
//   final priceController = TextEditingController();
//   final salePriceController = TextEditingController();
//   final stockController = TextEditingController();
//   final categoryIdController = TextEditingController();
//   final brandNameController = TextEditingController();
//   final skuController = TextEditingController();
//   String? _thumbnailUrl;
//   List<String> _images = [];
//   final ImagePicker _picker = ImagePicker();
//   bool _isLoading = false;
//   bool _isFeatured = true;

//   Future<void> _pickImage() async {
//     final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       setState(() {
//         _isLoading = true;
//       });
//       final storageRef = FirebaseStorage.instance
//           .ref()
//           .child('product_images/${pickedFile.name}');
//       final uploadTask = storageRef.putFile(File(pickedFile.path));
//       final snapshot = await uploadTask.whenComplete(() {});
//       final downloadUrl = await snapshot.ref.getDownloadURL();
//       setState(() {
//         _thumbnailUrl = downloadUrl;
//         _isLoading = false;
//       });
//     }
//   }

//   Future<void> _pickMultipleImages() async {
//     final pickedFiles = await _picker.pickMultiImage();
//     if (pickedFiles != null) {
//       setState(() {
//         _isLoading = true;
//       });
//       for (var pickedFile in pickedFiles) {
//         final storageRef = FirebaseStorage.instance
//             .ref()
//             .child('product_images/${pickedFile.name}');
//         final uploadTask = storageRef.putFile(File(pickedFile.path));
//         final snapshot = await uploadTask.whenComplete(() {});
//         final downloadUrl = await snapshot.ref.getDownloadURL();
//         _images.add(downloadUrl);
//       }
//       setState(() {
//         _isLoading = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final productController = Get.put(ProductController());

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('افزودن محصول'),
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               TextFormField(
//                 controller: titleController,
//                 decoration: InputDecoration(labelText: 'عنوان محصول'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'لطفاً عنوان محصول را وارد کنید';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 controller: descriptionController,
//                 decoration: InputDecoration(labelText: 'توضیحات'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'لطفاً توضیحات را وارد کنید';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 controller: priceController,
//                 decoration: InputDecoration(labelText: 'قیمت'),
//                 keyboardType: TextInputType.number,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'لطفاً قیمت را وارد کنید';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 controller: salePriceController,
//                 decoration: InputDecoration(labelText: 'قیمت فروش'),
//                 keyboardType: TextInputType.number,
//               ),
//               TextFormField(
//                 controller: stockController,
//                 decoration: InputDecoration(labelText: 'موجودی'),
//                 keyboardType: TextInputType.number,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'لطفاً موجودی را وارد کنید';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 controller: categoryIdController,
//                 decoration: InputDecoration(labelText: 'آیدی دسته‌بندی'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'لطفاً آیدی دسته‌بندی را وارد کنید';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 controller: brandNameController,
//                 decoration: InputDecoration(labelText: 'نام برند'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'لطفاً نام برند را وارد کنید';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 controller: skuController,
//                 decoration: InputDecoration(labelText: 'SKU'),
//               ),
//               SizedBox(height: 10),
//               _isLoading
//                   ? CircularProgressIndicator()
//                   : ElevatedButton(
//                       onPressed: _pickImage,
//                       child: Text('انتخاب تصویر شاخص'),
//                     ),
//               if (_thumbnailUrl != null)
//                 Image.network(
//                   _thumbnailUrl!,
//                   height: 100,
//                 ),
//               SizedBox(height: 10),
//               _isLoading
//                   ? CircularProgressIndicator()
//                   : ElevatedButton(
//                       onPressed: _pickMultipleImages,
//                       child: Text('انتخاب تصاویر بیشتر'),
//                     ),
//               if (_images.isNotEmpty)
//                 SizedBox(
//                   height: 100,
//                   child: ListView.builder(
//                     scrollDirection: Axis.horizontal,
//                     itemCount: _images.length,
//                     itemBuilder: (context, index) => Image.network(
//                       _images[index],
//                       height: 100,
//                     ),
//                   ),
//                 ),
//               SwitchListTile(
//                 title: Text('ویژه باشد؟'),
//                 value: _isFeatured,
//                 onChanged: (value) {
//                   setState(() {
//                     _isFeatured = value;
//                   });
//                 },
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   if (_formKey.currentState!.validate()) {
//                     final product = ProductModel(
//                       id: '',
//                       title: titleController.text,
//                       description: descriptionController.text,
//                       price: double.parse(priceController.text),
//                       salePrice: salePriceController.text.isNotEmpty
//                           ? double.parse(salePriceController.text)
//                           : 0.0,
//                       stock: int.parse(stockController.text),
//                       thumbnail: _thumbnailUrl!,
//                       images: _images,
//                       categoryId: categoryIdController.text,
//                       brand: BrandModel(
//                           id: '',
//                           name: brandNameController.text,
//                           image: '',
//                           isFeatured: false,
//                           productCount: 0),
//                       productType: '',
//                       isFeatured: _isFeatured,
//                     );

//                     productController.addProduct(product);

//                     GLoaders.customToast(message: 'محصول با موفقیت اضافه شد');
//                     Get.back();
//                   }
//                 },
//                 child: Text('افزودن محصول'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gemglow/model/brand-model.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:gemglow/constants/widgets-page/loader.dart';
import 'package:gemglow/controller/product-controller.dart';
import 'package:gemglow/controller/category-controller.dart';
import 'package:gemglow/model/product-model.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AddProductScreen extends StatefulWidget {
  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();
  final salePriceController = TextEditingController();
  final stockController = TextEditingController();
  final brandNameController = TextEditingController();
  final skuController = TextEditingController();
  String? _thumbnailUrl;
  List<String> _images = [];
  final ImagePicker _picker = ImagePicker();
  bool _isLoading = false;
  bool _isFeatured = true;
  String? selectedCategoryId;

  @override
  void initState() {
    super.initState();
    final categoryController = Get.put(CategoryController());
    categoryController.fetchCategories();
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _isLoading = true;
      });
      final storageRef = FirebaseStorage.instance
          .ref()
          .child('product_images/${pickedFile.name}');
      final uploadTask = storageRef.putFile(File(pickedFile.path));
      final snapshot = await uploadTask.whenComplete(() {});
      final downloadUrl = await snapshot.ref.getDownloadURL();
      setState(() {
        _thumbnailUrl = downloadUrl;
        _isLoading = false;
      });
    }
  }

  Future<void> _pickMultipleImages() async {
    final pickedFiles = await _picker.pickMultiImage();
    setState(() {
      _isLoading = true;
    });
    for (var pickedFile in pickedFiles) {
      final storageRef = FirebaseStorage.instance
          .ref()
          .child('product_images/${pickedFile.name}');
      final uploadTask = storageRef.putFile(File(pickedFile.path));
      final snapshot = await uploadTask.whenComplete(() {});
      final downloadUrl = await snapshot.ref.getDownloadURL();
      _images.add(downloadUrl);
    }
    setState(() {
      _isLoading = false;
    });
    }

  Future<void> _saveProduct(ProductModel product) async {
    final productController = Get.put(ProductController());
    await productController.addProduct(product);

    // Save category-product relation
    if (selectedCategoryId != null && selectedCategoryId!.isNotEmpty) {
      await productController.addProductToCategory(
          product.id, selectedCategoryId!);
    }
  }

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.find<CategoryController>();

    return Scaffold(
      appBar: AppBar(
        title: Text('افزودن محصول'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'عنوان محصول'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'لطفاً عنوان محصول را وارد کنید';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: descriptionController,
                decoration: InputDecoration(labelText: 'توضیحات'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'لطفاً توضیحات را وارد کنید';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: priceController,
                decoration: InputDecoration(labelText: 'قیمت'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'لطفاً قیمت را وارد کنید';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: salePriceController,
                decoration: InputDecoration(labelText: 'قیمت فروش'),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                controller: stockController,
                decoration: InputDecoration(labelText: 'موجودی'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'لطفاً موجودی را وارد کنید';
                  }
                  return null;
                },
              ),
              Obx(() {
                if (categoryController.isLoading.value) {
                  return CircularProgressIndicator();
                }
                return DropdownButtonFormField<String>(
                  decoration: InputDecoration(labelText: 'دسته‌بندی'),
                  items: categoryController.allCategories
                      .map((category) => DropdownMenuItem(
                            value: category.id,
                            child: Text(category.name),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedCategoryId = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'لطفاً دسته‌بندی را انتخاب کنید';
                    }
                    return null;
                  },
                );
              }),
              TextFormField(
                controller: brandNameController,
                decoration: InputDecoration(labelText: 'نام برند'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'لطفاً نام برند را وارد کنید';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: skuController,
                decoration: InputDecoration(labelText: 'SKU'),
              ),
              SizedBox(height: 10),
              _isLoading
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: _pickImage,
                      child: Text('انتخاب تصویر شاخص'),
                    ),
              if (_thumbnailUrl != null)
                Image.network(
                  _thumbnailUrl!,
                  height: 100,
                ),
              SizedBox(height: 10),
              _isLoading
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: _pickMultipleImages,
                      child: Text('انتخاب تصاویر بیشتر'),
                    ),
              if (_images.isNotEmpty)
                SizedBox(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _images.length,
                    itemBuilder: (context, index) => Image.network(
                      _images[index],
                      height: 100,
                    ),
                  ),
                ),
              SwitchListTile(
                title: Text('ویژه باشد؟'),
                value: _isFeatured,
                onChanged: (value) {
                  setState(() {
                    _isFeatured = value;
                  });
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final product = ProductModel(
                      id: '',
                      title: titleController.text,
                      description: descriptionController.text,
                      price: double.parse(priceController.text),
                      salePrice: salePriceController.text.isNotEmpty
                          ? double.parse(salePriceController.text)
                          : 0.0,
                      stock: int.parse(stockController.text),
                      thumbnail: _thumbnailUrl!,
                      images: _images,
                      categoryId: selectedCategoryId,
                      brand: BrandModel(
                          id: '',
                          name: brandNameController.text,
                          image: '',
                          isFeatured: false,
                          productCount: 0),
                      productType: '',
                      isFeatured: _isFeatured,
                    );

                    _saveProduct(product);

                    GLoaders.customToast(message: 'محصول با موفقیت اضافه شد');
                    Get.back();
                  }
                },
                child: Text('افزودن محصول'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
