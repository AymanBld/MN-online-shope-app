import 'package:finale/core/constant/routes.dart';
import 'package:finale/core/middleware/mymiddleware.dart';
import 'package:finale/view/screens/auth/check_code.dart';
import 'package:finale/view/screens/auth/chek_email.dart';
import 'package:finale/view/screens/auth/reset_password.dart';
import 'package:finale/view/screens/auth/login.dart';
import 'package:finale/view/screens/auth/signup.dart';
import 'package:finale/view/screens/auth/success.dart';
import 'package:finale/view/screens/auth/chose_lang.dart';
import 'package:finale/view/screens/cart/cart.dart';
import 'package:finale/view/screens/cart/check_out.dart';
import 'package:finale/view/screens/favorite.dart';
import 'package:finale/view/screens/home/categorie.dart';
import 'package:finale/view/screens/home/product.dart';
import 'package:finale/view/screens/navbar.dart';
import 'package:finale/view/screens/auth/onboarding.dart';
import 'package:finale/view/screens/setting/orders/order_details.dart';
import 'package:finale/view/screens/setting/orders/orders.dart';
import 'package:finale/view/screens/search.dart';
import 'package:finale/view/screens/setting/address/adress.dart';
import 'package:finale/view/screens/setting/address/new_address.dart';
import 'package:finale/view/screens/setting/address/new_address_position.dart';
import 'package:finale/view/screens/setting/orders/orders_archive.dart';
import 'package:finale/view/screens/setting/setting.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

List<GetPage<dynamic>> routes = [
  // GetPage(name: '/', page: () => const CheckOut()),
  GetPage(
    name: '/',
    page: () => const ChoseLang(),
    middlewares: [Mymiddleware()],
    
  ),

  //
  GetPage(name: AppRoutes.onboarding, page: () => const Onboarding()),

  //auth
  GetPage(name: AppRoutes.login, page: () => const Login()),
  GetPage(name: AppRoutes.signUp, page: () => const SignUp()),
  GetPage(name: AppRoutes.checkCode, page: () => const CheckCode()),
  GetPage(name: AppRoutes.checkEmeil, page: () => const CheckEmail()),
  GetPage(name: AppRoutes.resetPassword, page: () => const ResetPassword()),
  GetPage(name: AppRoutes.success, page: () => const Success()),

  //products
  GetPage(name: AppRoutes.navBar, page: () => const NavBar()),
  GetPage(name: AppRoutes.categories, page: () => const Categories()),
  GetPage(name: AppRoutes.product, page: () => const Product()),

  //setting
  GetPage(name: AppRoutes.setting, page: () => const Setting()),
  GetPage(name: AppRoutes.address, page: () => const Address()),
  GetPage(name: AppRoutes.newAddress, page: () => const NewAddress()),
  GetPage(name: AppRoutes.addressPosition, page: () => const NewAdrressPosition()),

  //order
  GetPage(name: AppRoutes.cart, page: () => const Cart()),
  GetPage(name: AppRoutes.checkOut, page: () => const CheckOut()),
  GetPage(name: AppRoutes.orders, page: () => const Orders()),
  GetPage(name: AppRoutes.orderDetails, page: () => const OrderDetails()),
  GetPage(name: AppRoutes.archiv, page: () => const OrdersArchive()),

  //home
  GetPage(name: AppRoutes.myFavorite, page: () => const MyFavorite()),
  GetPage(name: AppRoutes.search, page: () => const Search()),
];
