import 'package:finale/controller/onboarding_ctrl.dart';
import 'package:finale/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustumPageView extends GetView<OnboardingController> {
  const CustumPageView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageCtrl,
      onPageChanged: (value) => controller.onPageChanged(value),
      itemCount: onboardingList.length,
      itemBuilder: (context, index) => Column(
        children: [
          Text(
            onboardingList[index].title,
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
          Image.asset(
            onboardingList[index].image,
            height: Get.width,
          ),
          Text(
            onboardingList[index].body,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
