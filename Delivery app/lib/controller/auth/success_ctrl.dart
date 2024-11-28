import 'package:final_delivery/core/constant/routes.dart';
import 'package:get/get.dart';

class SuccessController extends GetxController {
  goToLogin() {
    Get.offAllNamed(AppRoutes.login);
  }
}
