import 'package:gemglow/constants/widgets-page/loader.dart';
import 'package:gemglow/data/repository/brand-repository.dart';
import 'package:gemglow/data/repository/product-repository.dart';
import 'package:gemglow/model/brand-model.dart';
import 'package:gemglow/model/product-model.dart';
import 'package:get/get.dart';

class BrandController extends GetxController {
  static BrandController get instance => Get.find();

  RxBool isLoading = true.obs;
  final RxList<BrandModel> allBrands = <BrandModel>[].obs;
  final RxList<BrandModel> featureBrands = <BrandModel>[].obs;
  final brandRepository = Get.put(BrandRepository());

  @override
  void onInit() {
    getFeaturedBrands();
    super.onInit();
  }

  Future<void> getFeaturedBrands() async {
    try {
      isLoading.value = true;

      final brands = await brandRepository.getAllBrands();

      allBrands.assignAll(brands);

      featureBrands.assignAll(
          allBrands.where((brand) => brand.isFeatured ?? false).take(4));
    } catch (e) {
      GLoaders.errorSnackBar(title: 'خطایی رخ داده', message: e.toString());
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  Future<List<ProductModel>> getBrandProducts(
      {required String brandId, int limit = -1}) async {
    try {
      final products = await ProductRepository.instance
          .getProductsForBrand(brandId: brandId, limit: limit);
      return products;
    } catch (e) {
      GLoaders.errorSnackBar(title: 'خطایی رخ داده!', message: e.toString());
      return [];
    }
  }

  Future<List<BrandModel>> getBrandsForCategory(String categoryId) async {
    try {
      final brands = await brandRepository.getBrandsForCategory(categoryId);
      return brands;
    } catch (e) {
      GLoaders.errorSnackBar(title: 'خطایی رخ داده!', message: e.toString());
      return [];
    }
  }
}
