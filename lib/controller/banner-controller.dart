import 'package:gemglow/constants/widgets-page/loader.dart';
import 'package:gemglow/data/repository/banner-repository.dart';
import 'package:gemglow/model/banner-model.dart';
import 'package:get/get.dart';

class BannerController extends GetxController {
  final carousalCurrentIndex = 0.obs;
  final isLoading = false.obs;
  final RxList<BannerModel> banners = <BannerModel>[].obs;

  @override
  void onInit() {
    fetchBanners();
    super.onInit();
  }

  void updatePageIndicator(index) {
    carousalCurrentIndex.value = index;
  }

  Future<void> fetchBanners() async {
    try {
      isLoading.value = true;

      final bannerRepo = Get.put(BannerRepository());
      final banners = await bannerRepo.fetchBanners();

      this.banners.assignAll(banners);
    } catch (e) {
      GLoaders.errorSnackBar(title: 'خطایی رخ داده', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
