import 'package:gemglow/constants/widgets-page/loader.dart';
import 'package:gemglow/data/repository/product-repository.dart';
import 'package:gemglow/model/product-model.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  final isLoading = false.obs;
  final productRepository = Get.put(ProductRepository());
  RxList<ProductModel> featuredProducts = <ProductModel>[].obs;

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
      //final products = await productRepository.getFeaturedProducts();
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

  // String getProductPrice(ProductModel product) {
  //   double smallestPrice = double.infinity;
  //   double largestPrice = 0.0;

  //   if (product.productType == ProductType.single.toString()) {
  //     return (product.salePrice > 0 ? product.salePrice : product.price)
  //         .toString();
  //   } else {
  //     if (smallestPrice.isEqual(largestPrice)) {
  //       return largestPrice.toString();
  //     } else {
  //       return '$smallestPrice - \$$largestPrice';
  //     }
  //   }
  // }

  String? calculateSalePercentage(
      double originalPrice, double discountPercentage) {
    if (discountPercentage <= 0.0) return null;
    if (originalPrice <= 0) return null;

    double salePrice =
        originalPrice - (originalPrice * discountPercentage / 100);
    double percentage = ((originalPrice - salePrice) / originalPrice) * 100;
    return percentage.toStringAsFixed(0);
  }

  // String? calculateSalePercentage(double originalPrice, double? salePrice) {
  //   if (salePrice == null || salePrice <= 0.0) return null;
  //   if (originalPrice <= 0) return null;

  //   double percentage = ((originalPrice - salePrice) / originalPrice) * 100;
  //   return percentage.toStringAsFixed(0);
  // }

  String getProductStockStatus(int stock) {
    return stock > 0 ? 'موجود در انبار' : 'ناموجود';
  }
}
