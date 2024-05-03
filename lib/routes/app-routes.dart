import 'package:gemglow/routes/routes.dart';
import 'package:gemglow/view/checkout-screen.dart';
import 'package:gemglow/view/forget-password-screen.dart';
import 'package:gemglow/view/home-screen.dart';
import 'package:gemglow/view/login-screen.dart';
import 'package:gemglow/view/onboarding-screen.dart';
import 'package:gemglow/view/order-screen.dart';
import 'package:gemglow/view/product-reviews-screen.dart';
import 'package:gemglow/view/profile-screen.dart';
import 'package:gemglow/view/setting-screen.dart';
import 'package:gemglow/view/signup-screen.dart';
import 'package:gemglow/view/store-screen.dart';
import 'package:gemglow/view/user-address-screen.dart';
import 'package:gemglow/view/verify-email-screen.dart';
import 'package:gemglow/view/wishlist-screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: GRoutes.home, page: () => const HomeScreen()),
    GetPage(name: GRoutes.store, page: () => const StoreScreen()),
    GetPage(name: GRoutes.favourites, page: () => const WishListScreen()),
    GetPage(name: GRoutes.settings, page: () => const SettingScreen()),
    GetPage(
        name: GRoutes.productReviews, page: () => const ProductReviewsScreen()),
    GetPage(name: GRoutes.order, page: () => const OrderScreen()),
    GetPage(name: GRoutes.checkout, page: () => const CheckoutScreen()),
    // GetPage(name: GRoutes.cart, page: () => const CartScreen()),
    GetPage(name: GRoutes.userProfile, page: () => const ProfileScreen()),
    GetPage(name: GRoutes.userAddress, page: () => const UserAddressScreen()),
    GetPage(name: GRoutes.signup, page: () => const SignUpScreen()),
    GetPage(name: GRoutes.verifyEmail, page: () => const VerifyEmailScreen()),
    GetPage(name: GRoutes.signIn, page: () => const LoginScreen()),
    GetPage(
        name: GRoutes.forgetPassword, page: () => const ForgetPasswordScreen()),
    GetPage(name: GRoutes.onBoaerding, page: () => const OnBoardingScreen()),
  ];
}
