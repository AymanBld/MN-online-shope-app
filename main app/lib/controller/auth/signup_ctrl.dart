import 'package:finale/core/class/crud.dart';
import 'package:finale/core/constant/routes.dart';
import 'package:finale/core/functions/handle_statuss.dart';
import 'package:finale/data/datasource/remote/signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SignUpControllerAll extends GetxController {
  signup();
  goToLogin();
  onPasswordTap();
}

class SignUpController extends SignUpControllerAll {
  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController phone;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool? sucureText = true;

  StatusRequest? statusrequest;
  SignupData data = SignupData(Get.find());

  @override
  signup() async {
    if (formKey.currentState!.validate()) {
      statusrequest = StatusRequest.loading;
      update();

      Map response = await data.postRequest(username.text, email.text, password.text, phone.text);
      statusrequest = handlingStatus(response);
      update();

      if (statusrequest == StatusRequest.success) {
        Get.offNamed(
          AppRoutes.checkCode,
          arguments: {'email': email.text, 'where': 'signup'},
        );
      } else if (statusrequest == StatusRequest.failed) {
        Get.defaultDialog(
          title: 'warning',
          content: const Text(
            'Email or Phone allredy existe!',
          ),
        );
      }
    }
  }

  @override
  goToLogin() {
    Get.offNamed(AppRoutes.login);
  }

  @override
  onPasswordTap() {
    sucureText = !sucureText!;
    update();
  }

  @override
  void onInit() {
    username = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    phone = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    username.dispose();
    email.dispose();
    password.dispose();
    phone.dispose();
    super.onClose();
  }
}
