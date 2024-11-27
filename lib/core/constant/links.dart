class AppLinks {
  //

  static const String serverLink = "http://10.0.2.2/ecommerce";
  // static const String serverLink = "https://aymanbld.kesug.com/ecommerce";

  //--------auth---------------------------------------------------------------

  static const String login = "$serverLink/auth/login.php";
  static const String signup = "$serverLink/auth/signup.php";
  static const String verifyCodeSignup = "$serverLink/auth/verify_code_signup.php";
  static const String verifyCodeReset = "$serverLink/auth/verify_code_reset.php";
  static const String resendCode = "$serverLink/auth/resend_code.php";
  static const String checkEmail = "$serverLink/auth/check_email.php";
  static const String resetPassword = "$serverLink/auth/reset_password.php";

  //--------home---------------------------------------------------------

  static const String home = "$serverLink/home/home.php";
  static const String products = "$serverLink/home/products.php";
  static const String search = "$serverLink/home/search.php";

  //--------favorite---------------------------------------------------------

  static const String addFav = "$serverLink/favorite/add_fav.php";
  static const String removFav = "$serverLink/favorite/remove_fav.php";
  static const String getFav = "$serverLink/favorite/get_fav.php";

  //--------cart---------------------------------------------------------

  static const String updateCart = "$serverLink/cart/update_cart.php";
  static const String removCart = "$serverLink/cart/remove_cart.php";
  static const String getCart = "$serverLink/cart/get_cart.php";
  static const String checkCoupon = "$serverLink/cart/check_coupon.php";

  static const String orderNow = "$serverLink/orders/add_order.php";
  static const String deleteOrder = "$serverLink/orders/delete_order.php";
  static const String getOrders = "$serverLink/orders/get_orders.php";
  static const String getOrderDetails = "$serverLink/orders/order_details.php";
  static const String getOrderArchive = "$serverLink/orders/get_orders_archive.php";

  //--------address---------------------------------------------------------

  static const String addAdr = "$serverLink/address/add_adr.php";
  static const String removAdr = "$serverLink/address/remove_adr.php";
  static const String getAdr = "$serverLink/address/get_adr.php";
}
