import 'package:finale/core/class/crud.dart';
import 'package:finale/core/constant/links.dart';
import 'package:finale/core/constant/routes.dart';
import 'package:finale/core/functions/handle_statuss.dart';
import 'package:finale/data/datasource/remote/verifycode.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CheckCodeCtrl extends GetxController {
  VerifyCodeData data = VerifyCodeData(Get.find());
  StatusRequest? statusrequest;
  Crud crud = Crud();

  late String email;
  late String where;

  checkCode(String code) async {
    statusrequest = StatusRequest.loading;
    update();

    Map response = where == 'signup'
        ? await data.verifySignupRequest(email, code)
        : await data.verifyResetRequest(email, code);

    statusrequest = handlingStatus(response);
    update();

    if (statusrequest == StatusRequest.success) {
      where == 'signup'
          ? Get.offAllNamed(AppRoutes.success)
          : Get.offAllNamed(AppRoutes.resetPassword, arguments: {'email': email});
    } else if (statusrequest == StatusRequest.failed) {
      Get.defaultDialog(
        title: 'warning',
        content: const Text('Incorrect code !'),
      );
    }
  }

  resendCode() {
    crud.postData(AppLinks.resendCode, {'user_email': email});
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    where = Get.arguments['where'];
    super.onInit();
  }
}
