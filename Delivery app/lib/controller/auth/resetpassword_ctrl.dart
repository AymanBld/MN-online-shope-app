import 'package:final_delivery/core/class/crud.dart';
import 'package:final_delivery/core/constant/links.dart';
import 'package:final_delivery/core/constant/routes.dart';
import 'package:final_delivery/core/functions/handle_statuss.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordCtrl extends GetxController {
  late TextEditingController password;
  late TextEditingController resetpassword;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  StatusRequest? statusrequest;
  Crud crud = Crud();

  late String email;

  resetPass() async {
    if (formKey.currentState!.validate()) {
      if (password.text == resetpassword.text) {
        statusrequest = StatusRequest.loading;
        update();

        Map response = await crud.postData(AppLinks.resetPassword, {
          'delivery_email': email,
          'delivery_pass': password.text,
        });
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
