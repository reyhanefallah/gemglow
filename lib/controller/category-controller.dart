import 'package:gemglow/constants/widgets-page/loader.dart';
import 'package:gemglow/data/repository/cate-repository.dart';
import 'package:gemglow/model/categories-model.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final isLoading = false.obs;
  final _categoryRepository = Get.put(CategoryRepository());
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
}
