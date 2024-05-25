import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gemglow/constants/color-string.dart';
import 'package:gemglow/constants/widgets/appbar.dart';
import 'package:gemglow/constants/widgets/widgets.dart';
import 'package:gemglow/model/brand-model.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
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
      appBar: GAppBar(
        title: Text('افزودن محصول'),
        leadingIcon: IconButton(
          icon: Icon(Iconsax.arrow_right_3),
          onPressed: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Iconsax.message_edit),
                  labelText: 'عنوان محصول',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                controller: titleController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'لطفاً عنوان محصول را وارد کنید';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: descriptionController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Iconsax.clipboard_text),
                  labelText: 'توضیحات',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'لطفاً توضیحات را وارد کنید';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: priceController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Iconsax.money),
                        labelText: 'قیمت',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'لطفاً قیمت را وارد کنید';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      controller: salePriceController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Iconsax.percentage_circle),
                        labelText: 'تخفیف',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: stockController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Iconsax.box_add),
                  labelText: 'موجودی',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'لطفاً موجودی را وارد کنید';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              Obx(() {
                if (categoryController.isLoading.value) {
                  return CircularProgressIndicator();
                }
                return DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                      labelText: 'دسته‌بندی',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
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
              SizedBox(height: 16),
              TextFormField(
                controller: brandNameController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Iconsax.shop),
                  labelText: 'نام برند',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'لطفاً نام برند را وارد کنید';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              _isLoading
                  ? CircularProgressIndicator()
                  : SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: OutlinedButton(
                        child: Text('انتخاب تصویر'),
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all<OutlinedBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        onPressed: _pickImage,
                      ),
                    ),
              if (_thumbnailUrl != null)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(
                    _thumbnailUrl!,
                    height: 100,
                  ),
                ),
              SizedBox(height: 16),
              _isLoading
                  ? CircularProgressIndicator()
                  : SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: OutlinedButton(
                        child: Text('انتخاب تصاویر بیشتر'),
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all<OutlinedBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        onPressed: _pickMultipleImages,
                      ),
                    ),
              if (_images.isNotEmpty)
                SizedBox(
                  height: 100,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _images.length,
                      itemBuilder: (context, index) => Image.network(
                        _images[index],
                        height: 100,
                      ),
                    ),
                  ),
                ),
              SizedBox(height: 16),
              SwitchListTile(
                title: Text('به فروشگاه اضافه شود؟'),
                value: _isFeatured,
                onChanged: (value) {
                  setState(() {
                    _isFeatured = value;
                  });
                },
              ),
              SizedBox(height: 20),
              GElevatedButton(
                GonPressed: () {
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
                Gtitle: 'افزودن محصول',
                Gstyle: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .apply(color: Colors.white),
                Gcolor: GColor.primaryColor1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
