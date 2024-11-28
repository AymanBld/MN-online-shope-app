import 'package:final_delivery/core/class/crud.dart';
import 'package:final_delivery/core/constant/links.dart';
import 'package:final_delivery/core/constant/routes.dart';
import 'package:final_delivery/core/functions/handle_statuss.dart';
import 'package:final_delivery/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class LoginControllerAll extends GetxController {
  login();
  forgetPass();
  onPasswordTap();
}

class LoginController extends LoginControllerAll {
  late TextEditingController email;
  late TextEditingController password;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool? sucureText = true;
  StatusRequest? statusrequest;
  Crud crud = Crud();
  Myservices myservices = Get.find();

  @override
  login() async {
    if (formKey.currentState!.validate()) {
      statusrequest = StatusRequest.loading;
      update();

      Map response = await crud.postData(AppLinks.login, {
        'delivery_email': email.text,
        'delivery_pass': password.text,
      });
      statusrequest = handlingStatus(response);
      update();

      if (statusrequest == StatusRequest.success) {
        myservices.sharedpref.setInt('step', 1);
        myservices.sharedpref.setString('id', response['data'][0]['delivery_id'].toString());
        myservices.sharedpref.setString('username', response['data'][0]['delivery_name']);
        myservices.sharedpref.setString('email', response['data'][0]['delivery_email']);
        myservices.sharedpref.setString('phone', response['data'][0]['delivery_phone']);
        Get.offAllNamed(AppRoutes.navBar);
      } else if (statusrequest == StatusRequest.failed) {
        Get.defaultDialog(
          title: 'warning',
          content: const Text(
            'Email or password not correct',
          ),
        );
      }
    }
  }

  @override
  forgetPass() {
    Get.toNamed(AppRoutes.checkEmeil);
  }

  @override
  onPasswordTap() {
    sucureText = !sucureText!;
    update();
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    email.dispose();
    password.dispose();
    super.onClose();
  }
}
