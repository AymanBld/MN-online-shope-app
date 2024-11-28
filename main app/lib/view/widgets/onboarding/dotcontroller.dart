import 'package:finale/controller/onboarding_ctrl.dart';
import 'package:finale/core/constant/colors.dart';
import 'package:finale/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDotController extends StatelessWidget {
  const CustomDotController({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardingController>(
      builder: (controller) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...List.generate(
            onboardingList.length,
            (index) => AnimatedContainer(
              margin: const EdgeInsets.all(3),
              duration: const Duration(milliseconds: 300),
              height: 8,
              width: controller.currentPage == index ? 30 : 8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColor.primryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
