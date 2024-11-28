import 'package:final_delivery/core/class/crud.dart';
import 'package:final_delivery/core/constant/links.dart';
import 'package:final_delivery/core/constant/routes.dart';
import 'package:final_delivery/core/functions/handle_statuss.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckCodeCtrl extends GetxController {
  StatusRequest? statusrequest;
  Crud crud = Crud();

  late String email;

  checkCode(String code) async {
    statusrequest = StatusRequest.loading;
    update();

    Map response = await crud.postData(AppLinks.verifyCodeReset, {
      'delivery_verifycode': code,
      'delivery_email': email,
    });

    statusrequest = handlingStatus(response);
    update();

    if (statusrequest == StatusRequest.success) {
      Get.offAllNamed(AppRoutes.resetPassword, arguments: {'email': email});
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
    super.onInit();
  }
}
