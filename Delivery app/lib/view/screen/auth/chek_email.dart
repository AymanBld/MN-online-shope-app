

import 'package:final_delivery/controller/auth/checkemail_ctrl.dart';
import 'package:final_delivery/core/class/handling_states.dart';
import 'package:final_delivery/core/constant/colors.dart';
import 'package:final_delivery/core/functions/validatore.dart';
import 'package:final_delivery/view/widget/auth/app_bar.dart';
import 'package:final_delivery/view/widget/auth/button.dart';
import 'package:final_delivery/view/widget/auth/custum_field.dart';
import 'package:final_delivery/view/widget/auth/header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckEmail extends StatelessWidget {
  const CheckEmail({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CheckEmailCtrl());

    return Scaffold(
        backgroundColor: AppColor.backgroundColor,
        appBar: CustumAppBar(title: 'check t'.tr),
        body: GetBuilder<CheckEmailCtrl>(
          builder: (controller) => HandlingStates(
            status: controller.statusrequest,
            widget: Padding(
              padding: const EdgeInsets.all(30),
              child: Form(
                key: controller.formKey,
                child: ListView(
                  children: [
                    Header(
                      title: 'check t'.tr,
                      subtitle: 'check s'.tr,
                    ),
                    const SizedBox(height: 60),
                    CustumTextField(
                      control: controller.email,
                      type: TextInputType.name,
                      valid: (val) {
                        return validate(val!, 'email');
                      },
                      hint: 'email h'.tr,
                      label: 'email lb'.tr,
                      icon: Icons.email_outlined,
                    ),
                    const SizedBox(height: 30),
                    CustumButton(
                      text: 'check'.tr,
                      ontap: () {
                        controller.checkEmail();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
