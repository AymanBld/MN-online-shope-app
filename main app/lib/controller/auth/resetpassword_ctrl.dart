
import 'package:finale/core/class/crud.dart';
import 'package:finale/core/constant/routes.dart';
import 'package:finale/core/functions/handle_statuss.dart';
import 'package:finale/data/datasource/remote/resetpass.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordCtrl extends GetxController {
  late TextEditingController password;
  late TextEditingController resetpassword;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  StatusRequest? statusrequest;
  ResestPassData data = ResestPassData(Get.find());

  late String email;

  resetPass() async {
    if (formKey.currentState!.validate()) {
      if (password.text == resetpassword.text) {
        statusrequest = StatusRequest.loading;
        update();

        Map response = await data.postRequest(email, resetpassword.text);
        statusrequest = handlingStatus(response);
        update();

        if (statusrequest == StatusRequest.success) {
          Get.offAllNamed(AppRoutes.success);
        } else if (statusrequest == StatusRequest.failed) {
          Get.defaultDialog(
            title: 'warning',
            content: const Text(
              'Email or Phone allredy existe!',
            ),
          );
        }
      } else {
        Get.defaultDialog(
          title: 'warning',
          content: const Text(
            'Verify your new password',
          ),
        );
      }
    }
  }

  @override
  void onInit() {
    password = TextEditingController();
    resetpassword = TextEditingController();
    email = Get.arguments['email'];
    super.onInit();
  }

  @override
  void onClose() {
    resetpassword.dispose();
    password.dispose();
    super.onClose();
  }
}
