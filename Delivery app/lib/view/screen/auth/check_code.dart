

import 'package:final_delivery/controller/auth/checkcode_ctrl.dart';
import 'package:final_delivery/core/class/handling_states.dart';
import 'package:final_delivery/core/constant/colors.dart';
import 'package:final_delivery/view/widget/auth/app_bar.dart';
import 'package:final_delivery/view/widget/auth/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class CheckCode extends StatelessWidget {
  const CheckCode({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CheckCodeCtrl());
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: CustumAppBar(title: 'code t'.tr),
      body: GetBuilder<CheckCodeCtrl>(
        builder: (controller) => HandlingStates(
          status: controller.statusrequest,
          widget: Padding(
            padding: const EdgeInsets.all(30),
            child: ListView(
              children: [
                Header(title: 'code t'.tr, subtitle: 'code s'.tr),
                const SizedBox(height: 60),
                OtpTextField(
                  numberOfFields: 5,
                  fieldWidth: 45,
                  borderWidth: 5,
                  clearText: true,
                  showFieldAsBox: true,
                  onSubmit: (String code) {
                    controller.checkCode(code);
                  },
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('I didn\'t recive the code'),
                    TextButton(
                      onPressed: () => controller.resendCode(),
                      child: const Text('resend the code'),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
