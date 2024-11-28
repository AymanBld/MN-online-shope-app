import 'package:final_delivery/binding.dart';
import 'package:final_delivery/core/localization/local_cotroller.dart';
import 'package:final_delivery/core/localization/translation.dart';
import 'package:final_delivery/core/services/services.dart';
import 'package:final_delivery/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
