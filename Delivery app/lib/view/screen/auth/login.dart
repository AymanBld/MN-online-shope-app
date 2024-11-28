import 'package:final_delivery/controller/auth/login_ctrl.dart';
import 'package:final_delivery/core/constant/colors.dart';
import 'package:final_delivery/core/functions/validatore.dart';
import 'package:final_delivery/view/widget/auth/app_bar.dart';
import 'package:final_delivery/view/widget/auth/button.dart';
import 'package:final_delivery/view/widget/auth/custum_field.dart';
import 'package:final_delivery/view/widget/auth/header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: const CustumAppBar(title: 'login'),
      body: GetBuilder<LoginController>(
        builder: (controller) => Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: controller.formKey,
            child: ListView(
              children: [
                Header(title: 'login t'.tr, subtitle: 'login s'.tr),
                const SizedBox(height: 60),
                CustumTextField(
                  control: controller.email,
                  type: TextInputType.emailAddress,
                  hint: 'email h'.tr,
                  label: 'email lb'.tr,
                  icon: Icons.email_outlined,
                  valid: (val) {
                    return validate(val!, 'email');
                  },
                ),
                const SizedBox(height: 30),
                GetBuilder<LoginController>(
                  builder: (controller) => CustumTextField(
                    control: controller.password,
                    type: TextInputType.text,
                    ispassword: controller.sucureText,
                    hint: 'pass h'.tr,
                    label: 'pass lb'.tr,
                    icon: Icons.lock_outline,
                    valid: (val) {
                      return validate(val!, 'password', min: 8);
                    },
                    onPasswordTap: () {
                      controller.onPasswordTap();
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      controller.forgetPass();
                    },
                    child: Text(
                      'forget'.tr,
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                CustumButton(
                  text: 'login',
                  ontap: () {
                    controller.login();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
