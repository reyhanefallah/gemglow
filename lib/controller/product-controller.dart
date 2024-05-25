import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gemglow/constants/widgets-page/loader.dart';
import 'package:gemglow/data/repository/product-repository.dart';
import 'package:gemglow/model/product-model.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  final isLoading = false.obs;
  final productRepository = Get.put(ProductRepository());
  RxList<ProductModel> featuredProducts = <ProductModel>[].obs;
  final RxList<ProductModel> searchResults = <ProductModel>[].obs;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  @override
  void onInit() {
    fetchFeaturedProducts();
    super.onInit();
  }

  void fetchFeaturedProducts() async {
    try {
      isLoading.value = true;

      final products = await productRepository.getFeaturedProducts();

      featuredProducts.assignAll(products);
    } catch (e) {
      GLoaders.errorSnackBar(title: 'خطایی رخ داده ', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<List<ProductModel>> fetchAllFeaturedProducts() async {
    try {
      final products = await productRepository.getAllFeaturedProducts();

      return products;
    } catch (e) {
      GLoaders.errorSnackBar(title: 'خطایی رخ داده ', message: e.toString());
      return [];
    }
  }

  String getProductPrice(ProductModel product) {
    if (product.salePrice <= 0) {
      return '${double.parse(product.price.toString()).toStringAsFixed(0)} تومان';
    }
    double originalPrice = double.parse(product.price.toString());
    double discountAmount = originalPrice * (product.salePrice / 100);
    double discountedPrice = originalPrice - discountAmount;
    return '${discountedPrice.toStringAsFixed(0)} تومان';
  }

  String? calculateSalePercentage(
      double originalPrice, double discountPercentage) {
    if (discountPercentage <= 0.0) return null;
    if (originalPrice <= 0) return null;

    double salePrice =
        originalPrice - (originalPrice * discountPercentage / 100);
    double percentage = ((originalPrice - salePrice) / originalPrice) * 100;
    return percentage.toStringAsFixed(0);
  }

  String getProductStockStatus(int stock) {
    return stock > 0 ? 'موجود در انبار' : 'ناموجود';
  }

  Future<void> fetchProductsByCategory(String categoryId) async {
    try {
      isLoading.value = true;
      final products =
          await productRepository.getProductsByCategory(categoryId);
      featuredProducts.assignAll(products);
    } catch (e) {
      GLoaders.errorSnackBar(title: 'خطایی رخ داده', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> addProductToCategory(String productId, String categoryId) async {
    try {
      isLoading.value = true;
      await productRepository.addProductToCategory(productId, categoryId);
    } catch (e) {
      GLoaders.errorSnackBar(title: 'خطایی رخ داده', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<String> addProduct(ProductModel product) async {
    try {
      isLoading.value = true;
      final newProductRef = _db.collection('Products').doc();
      product.id = newProductRef.id;
      await newProductRef.set(product.toJson());
      GLoaders.customToast(message: 'محصول با موفقیت اضافه شد');
      return newProductRef.id;
    } catch (e) {
      GLoaders.errorSnackBar(
          title: 'خطا در افزودن محصول', message: e.toString());
      return '';
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> searchProductsLocally(String query) async {
    try {
      isLoading.value = true;
      final products = await productRepository.getAllProducts();
      if (query.isEmpty) {
        searchResults.assignAll(products);
      } else {
        searchResults.assignAll(
          products
              .where((product) =>
                  product.title.toLowerCase().contains(query.toLowerCase()))
              .toList(),
        );
      }
    } catch (e) {
      GLoaders.errorSnackBar(title: 'خطایی رخ داده', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
