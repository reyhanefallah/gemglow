import 'package:gemglow/constants/widgets-page/loader.dart';
import 'package:gemglow/data/utils/local-storage.dart';
import 'package:gemglow/enums.dart';
import 'package:gemglow/model/cart-item-model.dart';
import 'package:gemglow/model/product-model.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  static CartController get instance => Get.find();

  RxInt noOfCartItems = 0.obs;
  RxDouble totalCartPrice = 0.0.obs;
  RxInt productQuantityInCart = 0.obs;
  RxList<CartItemModel> cartItems = <CartItemModel>[].obs;
  //final variationController = VariationController.instance;

// مشکل از اینه!
  // CartController() {
  //   loadCartItems();
  // }

  // void addToCart(ProductModel product) {
  //   if (productQuantityInCart.value < 1) {
  //     GLoaders.customToast(message: 'تعداد را انتخاب کنید');
  //     return;
  //   }

  //   if (product.productType == ProductType.variable.toString()) {
  //     // // select variation
  //     // GLoaders.customToast(message: 'تعداد را انتخاب کنید');
  //     // return;

  //     if (product.stock < 1) {
  //       GLoaders.warningSnackBar(title: 'محصول موجود نیست');
  //       return;
  //     }
  //   }
  //   final selectedCartItem =
  //       convertToCartItem(product, productQuantityInCart.value);

  //   int index = cartItems.indexWhere((cartItem) =>
  //       cartItem.productId == selectedCartItem.productId &&
  //       cartItem.variationId == selectedCartItem.variationId);

  //   if (index >= 0) {
  //     cartItems[index].quantity = selectedCartItem.quantity;
  //   } else {
  //     cartItems.add(selectedCartItem);
  //   }

  //   updateCart();
  //   GLoaders.customToast(message: 'محصول به سبد خرید اضافه شد.');
  // }

  // CartItemModel convertToCartItem(ProductModel product, int quantity) {
  //   if (product.productType == ProductType.single.toString()) {
  //     variationController.resetselectionattributes();
  //   }

  //   final variation = variationController.selectedVariation.value;
  //   final isVariation = variation.id.isNotEmpty;
  //   final price = isVariation
  //       ? variation.salePrice > 0.0
  //           ? variation.salePrice
  //           : variation.price
  //       : product.salePrice > 0.0
  //           ? product.salePrice
  //           : product.price;

  //   return CartItemModel(
  //     productId: product.id,
  //     title: product.title,
  //     price: price,
  //     quantity: quantity,
  //     variationId: variation.id,
  //     image: isVariation ? variation.image : product.thumbnail,
  //     brandName: product.brand != null ? product.brand!.name : '',
  //     selectedVariation: isVariation ? variation.attributes : null,
  //   );
  // }

  void addToCart(ProductModel product) {
    if (productQuantityInCart.value < 1) {
      GLoaders.customToast(message: 'تعداد را انتخاب کنید');
      return;
    }

    if (product.stock < 1) {
      GLoaders.warningSnackBar(title: 'محصول موجود نیست');
      return;
    }

    final selectedCartItem =
        convertToCartItem(product, productQuantityInCart.value);

    int index = cartItems.indexWhere(
        (cartItem) => cartItem.productId == selectedCartItem.productId);

    if (index >= 0) {
      cartItems[index].quantity += selectedCartItem.quantity;
    } else {
      cartItems.add(selectedCartItem);
    }

    updateCart();
    GLoaders.customToast(message: 'محصول به سبد خرید اضافه شد.');
  }

  CartItemModel convertToCartItem(ProductModel product, int quantity) {
    final price = product.salePrice > 0.0 ? product.salePrice : product.price;

    return CartItemModel(
      productId: product.id,
      title: product.title,
      price: price,
      quantity: quantity,
      variationId: '',
      image: product.thumbnail,
      brandName: product.brand != null ? product.brand!.name : '',
      selectedVariation: null,
    );
  }

  // // // // // // // // // // // // // //

  void updateCart() {
    updateCartTotals();
    saveCartItems();
    cartItems.refresh();
  }

  void updateCartTotals() {
    double calculatedTotalPrice = 0.0;
    int calculatedNoOfItems = 0;

    for (var item in cartItems) {
      calculatedTotalPrice += (item.price) * item.quantity.toDouble();
      calculatedNoOfItems += item.quantity;
    }
    totalCartPrice.value = calculatedTotalPrice;
    noOfCartItems.value = calculatedNoOfItems;
  }

  void saveCartItems() {
    final cartItemStrings = cartItems.map((item) => item.toJson()).toList();
    GLocalStorage.instance().writeData('cartItems', cartItemStrings);
  }

  void loadCartItems() {
    final cartItemStrings =
        GLocalStorage.instance().readData<List<dynamic>>('cartItems');
    if (cartItemStrings != null) {
      cartItems.assignAll(cartItemStrings
          .map((item) => CartItemModel.fromJson(item as Map<String, dynamic>)));
      updateCartTotals();
    }
  }

  int getProductQuantityInCart(String productId) {
    final foundItem = cartItems
        .where((item) => item.productId == productId)
        .fold(0, (previousValue, element) => previousValue + element.quantity);
    return foundItem;
  }

  int getVariationQuantityInCart(String productId, String variationId) {
    final foundItem = cartItems.firstWhere(
      (item) => item.productId == productId && item.variationId == variationId,
      orElse: () => CartItemModel.empty(),
    );
    return foundItem.quantity;
  }

  void clearCart() {
    productQuantityInCart.value = 0;
    cartItems.clear();
    updateCart();
  }

  void addOneToCart(CartItemModel item) {
    int index = cartItems.indexWhere((cartItem) =>
        cartItem.productId == item.productId &&
        cartItem.variationId == item.variationId);

    if (index >= 0) {
      cartItems[index].quantity += 1;
    } else {
      cartItems.add(item);
    }

    updateCart();
  }

  void removeOneFromCart(CartItemModel item) {
    int index = cartItems.indexWhere((cartItem) =>
        cartItem.productId == item.productId &&
        cartItem.variationId == item.variationId);

    if (index >= 0) {
      if (cartItems[index].quantity > 1) {
        cartItems[index].quantity -= 1;
      } else {
        removeFromCartDialog(index);
      }
    }

    updateCart();
  }

  void removeFromCartDialog(int index) {
    Get.defaultDialog(
      title: 'حذف محصول',
      middleText: 'آیا از حذف محصول اطمینان دارید؟',
      onConfirm: () {
        cartItems.removeAt(index);
        updateCart();
        GLoaders.customToast(message: 'محصول از سبد خرید حذف شد');
        Get.back();
      },
      onCancel: () => Get.back(),
    );
  }

  // void removeOneFromCart(CartItemModel item) {
  //   int index = cartItems.indexWhere((cartItem) =>
  //       cartItem.productId == item.productId &&
  //       cartItem.variationId == item.variationId);

  //   if (index >= 0) {
  //     if (cartItems[index].quantity > 1) ;
  //     cartItems[index].quantity -= 1;
  //   } else {
  //     cartItems[index].quantity == 1
  //         ? removeFromCartDialog(index)
  //         : cartItems.removeAt(index);
  //   }

  //   updateCart();
  // }

  // void removeFromCartDialog(int index) {
  //   Get.defaultDialog(
  //     title: 'حذف محصول',
  //     middleText: 'ایا از حذف محصول اطمینان دارید',
  //     onConfirm: () {
  //       cartItems.removeAt(index);
  //       updateCart();
  //       GLoaders.customToast(message: 'محصول از سبد خرید حذف شد');
  //       Get.back();
  //     },
  //     onCancel: () => () => Get.back(),
  //     // onCancel: () => Get.back(),
  //   );
  // }

  void updateAlreadyAddedProductCount(ProductModel product) {
    if (product.productType == ProductType.single.toString()) {
      productQuantityInCart.value = getProductQuantityInCart(product.id);
    }
    // else {
    //   final variationId = VariationController.selectedVariation.value.id;
    //   if (variationId.isNotEmpty) {
    //     productQuantityInCart.value =
    //         getVariationQuantityInCart(product.id, variationId);
    //   }
    else {
      productQuantityInCart.value = 0;
    }
  }
}
