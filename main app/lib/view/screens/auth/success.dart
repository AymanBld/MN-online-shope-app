import 'package:finale/controller/auth/success_ctrl.dart';
import 'package:finale/core/constant/colors.dart';
import 'package:finale/view/widgets/onboarding/app_bar.dart';
import 'package:finale/view/widgets/auth/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Success extends StatelessWidget {
  const Success({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(SuccessController());
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: const CustumAppBar(title: 'success'),
      body: Column(
        children: [
          const SizedBox(height: 30),
          const Center(
            child: Icon(
              Icons.check_circle_outline,
              size: 200,
              color: AppColor.primryColor,
            ),
          ),
          Text(
            'Success',
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontSize: 50, color: AppColor.primryColor),
          ),
          Text(
            'Your operation has been did succsefly',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const Spacer(),
          CustumButton(
            text: 'Go to Login',
            ontap: () {
              controller.goToLogin();
            },
          ),
          const SizedBox(height: 30)
        ],
      ),
    );
  }
}
