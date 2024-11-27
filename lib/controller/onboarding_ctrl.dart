import 'package:finale/core/constant/routes.dart';
import 'package:finale/core/services/services.dart';
import 'package:finale/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class OnboardingControllerAll extends GetxController {
  int currentPage = 0;
  next();
  onPageChanged(index);
}

class OnboardingController extends OnboardingControllerAll {
  PageController pageCtrl = PageController();
  Myservices myservices = Get.find();

  @override
  next() {
    if (currentPage == onboardingList.length - 1) {
      myservices.sharedpref.setInt('step', 1);
      Get.offAllNamed(AppRoutes.login);
    } else {
      pageCtrl.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  @override
  onPageChanged(index) {
    currentPage = index;
    update();
  }
}
