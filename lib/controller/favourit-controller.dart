import 'dart:convert';

import 'package:gemglow/constants/widgets-page/loader.dart';
import 'package:gemglow/data/repository/product-repository.dart';
import 'package:gemglow/data/utils/local-storage.dart';
import 'package:gemglow/model/product-model.dart';
import 'package:get/get.dart';

class FavouritesController extends GetxController {
  static FavouritesController get instance => Get.find();

  final favorites = <String, bool>{}.obs;

  @override
  void onInit() {
    initFavourites();
    super.onInit();
  }

  Future<void> initFavourites() async {
    final json = GLocalStorage.instance().readData('favorites');
    if (json != null) {
      final storedFavorites = jsonDecode(json) as Map<String, dynamic>;
      favorites.assignAll(
          storedFavorites.map((key, value) => MapEntry(key, value as bool)));
    }
  }

  bool isFavourite(String productId) {
    return favorites[productId] ?? false;
  }

  void toggleFavoriteProduct(String productId) {
    if (favorites.containsKey(productId)) {
      favorites[productId] = true;
      saveFavoritesToStorage();
      GLoaders.customToast(message: 'محصول به لیست علاقه مندی ها اضافه شد');
    } else {
      GLocalStorage.instance().removeData(productId);
      favorites.remove(productId);
      saveFavoritesToStorage();
      favorites.refresh();
      GLoaders.customToast(message: 'محصول از لیت علاقه مندی ها حذف شد');
    }
  }

  void saveFavoritesToStorage() {
    final encodeFavorites = json.encode(favorites);
    GLocalStorage.instance().saveData('favorites', encodeFavorites);
  }

  Future<List<ProductModel>> favoriteProducts() async {
    return await ProductRepository.instance
        .getFavouriteProducts(favorites.keys.toList());
  }
}
