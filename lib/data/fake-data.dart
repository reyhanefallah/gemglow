import 'package:gemglow/model/categories-model.dart';

class GDummyData {
  static final List<CategoryModel> categories = [
    CategoryModel(
        id: '1',
        name: 'جواهر',
        image: 'assets/png/jewel.png',
        isFeatured: true),
    CategoryModel(
        id: '2',
        name: 'درمانی',
        image: 'assets/png/therapy.png',
        isFeatured: true),
    CategoryModel(
        id: '3',
        name: 'طبیعی',
        image: 'assets/png/natural.png',
        isFeatured: true),
    CategoryModel(
        id: '4',
        name: 'مصنوعی',
        image: 'assets/png/synthetic.png',
        isFeatured: true),
    CategoryModel(
        id: '5',
        name: 'کالکشن',
        image: 'assets/png/collectible.png',
        isFeatured: true),
  ];
}
