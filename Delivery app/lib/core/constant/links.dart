class AppLinks {
  //

  static const String serverLink = "http://10.0.2.2/ecommerce";
  // static const String serverLink = "https://aymanbld.kesug.com/ecommerce";

  //--------auth---------------------------------------------------------------

  static const String login = "$serverLink/delivery/users/login.php";
  static const String verifyCodeReset = "$serverLink/delivery/users/verify_code_reset.php";
  static const String resendCode = "$serverLink/delivery/users/resend_code.php";
  static const String checkEmail = "$serverLink/delivery/users/check_email.php";
  static const String resetPassword = "$serverLink/delivery/users/reset_password.php";

  //--------orders---------------------------------------------------------

  static const String getAccepted = "$serverLink/delivery/orders/get_accepted.php";
  static const String getWaiting = "$serverLink/delivery/orders/get_waiting.php";
  static const String getCompleted = "$serverLink/delivery/orders/get_completed.php";
  static const String getOrderDetails = "$serverLink/orders/order_details.php";
  static const String acceptOrder = "$serverLink/delivery/orders/accept_order.php";
}
