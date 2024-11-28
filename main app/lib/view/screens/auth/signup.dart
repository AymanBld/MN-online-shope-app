import 'package:finale/controller/auth/signup_ctrl.dart';
import 'package:finale/core/constant/colors.dart';
import 'package:finale/core/functions/validatore.dart';
import 'package:finale/view/widgets/onboarding/app_bar.dart';
import 'package:finale/view/widgets/auth/custum_field.dart';
import 'package:finale/view/widgets/auth/haveaccount.dart';
import 'package:finale/view/widgets/auth/header.dart';
import 'package:finale/view/widgets/auth/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpController());
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: CustumAppBar(title: 'signup'.tr),
      body: GetBuilder<SignUpController>(
        builder: (controller) => Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: controller.formKey,
            child: ListView(
              children: [
                Header(
                  title: 'signup t'.tr,
                  subtitle: 'signup s'.tr,
                ),
                const SizedBox(height: 30),
                CustumTextField(
                  control: controller.username,
                  type: TextInputType.name,
                  valid: (val) {
                    return validate(val!, 'usernam');
                  },
                  hint: 'user h'.tr,
                  label: 'user lb'.tr,
                  icon: Icons.person_3_outlined,
                ),
                const SizedBox(height: 30),
                CustumTextField(
                  control: controller.email,
                  type: TextInputType.emailAddress,
                  valid: (val) {
                    return validate(val!, 'email');
                  },
                  hint: 'email h'.tr,
                  label: 'email lb'.tr,
                  icon: Icons.email_outlined,
                ),
                const SizedBox(height: 30),
                GetBuilder<SignUpController>(
                  builder: (controller) => CustumTextField(
                    control: controller.password,
                    type: TextInputType.text,
                    ispassword: controller.sucureText,
                    valid: (val) {
                      return validate(val!, 'password', min: 8);
                    },
                    onPasswordTap: () {
                      controller.onPasswordTap();
                    },
                    hint: 'pass h'.tr,
                    label: 'pass lb'.tr,
                    icon: Icons.lock_outline,
                  ),
                ),
                const SizedBox(height: 30),
                CustumTextField(
                  control: controller.phone,
                  type: TextInputType.phone,
                  valid: (val) {
                    return validate(val!, 'phone');
                  },
                  hint: 'phone h'.tr,
                  label: 'phone lb'.tr,
                  icon: Icons.phone_outlined,
                ),
                const SizedBox(height: 30),
                CustumButton(
                  text: 'signup'.tr,
                  ontap: () {
                    controller.signup();
                  },
                ),
                const SizedBox(height: 30),
                CustumHaveAccount(
                  pageToGo: 'login'.tr,
                  textBefor: 'goto l'.tr,
                  onTap: () {
                    controller.goToLogin();
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
