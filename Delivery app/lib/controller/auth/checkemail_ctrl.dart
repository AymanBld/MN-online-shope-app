import 'package:final_delivery/core/class/crud.dart';
import 'package:final_delivery/core/constant/links.dart';
import 'package:final_delivery/core/constant/routes.dart';
import 'package:final_delivery/core/functions/handle_statuss.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckEmailCtrl extends GetxController {
  Crud crud = Crud();
  late TextEditingController email;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  StatusRequest? statusrequest;

  checkEmail() async {
    if (formKey.currentState!.validate()) {
      statusrequest = StatusRequest.loading;
      update();

      Map response = await crud.postData(AppLinks.checkEmail, {'delivery_email': email.text});
      statusrequest = handlingStatus(response);
      update();

      if (statusrequest == StatusRequest.success) {
        Get.offAllNamed(
          AppRoutes.checkCode,
          arguments: {'email': email.text},
        );
      } else if (statusrequest == StatusRequest.failed) {
        Get.defaultDialog(
          title: 'warning',
          content: const Text(
            'Email not existe!',
          ),
        );
      }
    }
  }

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    email.dispose();
    super.onClose();
  }
}
