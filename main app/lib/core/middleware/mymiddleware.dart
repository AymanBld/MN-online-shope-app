import 'package:finale/core/constant/routes.dart';
import 'package:finale/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Mymiddleware extends GetMiddleware {
  Myservices myservices = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    if (myservices.sharedpref.getInt('step') == 2) {
      return const RouteSettings(name: AppRoutes.navBar);
    } else if (myservices.sharedpref.getInt('step') == 1) {
      return const RouteSettings(name: AppRoutes.login);
    }
    return null;
  }
}
