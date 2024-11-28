import 'package:finale/core/constant/routes.dart';
import 'package:finale/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocalCotroller extends GetxController {
  late Locale language;
  late ThemeData theme;

  Myservices myservices = Get.find();

  Future changeLang(String codelang) async {
    myservices.sharedpref.setString('lang', codelang);

    theme = themee(codelang);
    Get.changeTheme(theme);

    await Future.delayed(const Duration(milliseconds: 300));
    Get.offNamed(AppRoutes.onboarding);

    language = Locale(codelang);
    await Get.updateLocale(language);
  }

  @override
  void onInit() {
    String? currentLang = myservices.sharedpref.getString('lang');

    if (currentLang == 'ar') {
      language = const Locale('ar');
      theme = themee('ar');
    } else if (currentLang == 'en') {
      language = const Locale('en');
      theme = themee('en');
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
      theme = themee(language.languageCode);
    }
    super.onInit();
  }

  ThemeData themee(String lang) {
    return ThemeData(
      fontFamily: lang == 'ar' ? 'Cairo' : 'Exo2',
      textTheme: TextTheme(
        titleMedium: const TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
        bodyMedium: TextStyle(
          fontWeight: FontWeight.w300,
          fontSize: 16,
          color: Colors.grey[900],
        ),
      ),
    );
  }
}
