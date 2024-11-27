import 'package:finale/core/class/crud.dart';
import 'package:finale/core/constant/routes.dart';
import 'package:finale/core/functions/handle_statuss.dart';
import 'package:finale/data/datasource/remote/checkemail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckEmailCtrl extends GetxController {
  late TextEditingController email;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  StatusRequest? statusrequest;
  CheckEmailData data = CheckEmailData(Get.find());

  checkEmail() async {
    if (formKey.currentState!.validate()) {
      statusrequest = StatusRequest.loading;
      update();

      Map response = await data.postRequest(email.text);
      statusrequest = handlingStatus(response);
      update();

      if (statusrequest == StatusRequest.success) {
        Get.offAllNamed(
          AppRoutes.checkCode,
          arguments: {'email': email.text, 'where': 'reset'},
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
