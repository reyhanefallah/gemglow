import 'package:gemglow/constants/widgets-page/loader.dart';
import 'package:gemglow/data/repository/cate-repository.dart';
import 'package:gemglow/data/repository/product-repository.dart';
import 'package:gemglow/model/categories-model.dart';
import 'package:gemglow/model/product-model.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final isLoading = false.obs;
  final _categoryRepository = Get.put(CategoryRepository());
  final _db = FirebaseFirestore.instance;
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  Future<void> fetchCategories() async {
    try {
      isLoading.value = true;

      final categories = await _categoryRepository.getAllCategories();

      allCategories.assignAll(categories);

      featuredCategories.assignAll(allCategories
          .where((category) => category.isFeatured && category.parentId.isEmpty)
          .take(5)
          .toList());
    } catch (e) {
      GLoaders.errorSnackBar(title: 'خطایی رخ داده', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<List<CategoryModel>> getSubCategories(String categoryId) async {
    try {
      final subCategories =
          await _categoryRepository.getSubCategories(categoryId);
      return subCategories;
    } catch (e) {
      GLoaders.errorSnackBar(title: 'خطایی رخ داده', message: e.toString());
      return [];
    }
  }

  Future<List<ProductModel>> getCategoryProducts(
      {required String categoryId, int limit = 4}) async {
    final products = await ProductRepository.instance
        .getProductsForCategory(categoryId: categoryId, limit: limit);
    return products;
  }

  Future<void> addProductToCategory(String productId, String categoryId) async {
    try {
      final newCategoryProductRef = _db.collection('ProductCategory').doc();
      await newCategoryProductRef.set({
        'categoryId': categoryId,
        'productId': productId,
      });
    } catch (e) {
      GLoaders.errorSnackBar(
          title: 'خطا در افزودن محصول به دسته‌بندی', message: e.toString());
    }
  }
}
