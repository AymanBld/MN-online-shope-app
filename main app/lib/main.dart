import 'package:finale/binding.dart';
import 'package:finale/core/localization/local_cotroller.dart';
import 'package:finale/core/localization/translation.dart';
import 'package:finale/core/services/services.dart';
import 'package:finale/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(LocalCotroller());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: controller.language,
      translations: MyTranslation(),
      initialBinding: InitBinding(),
      theme: controller.theme,
      getPages: routes,
    );
  }
}
