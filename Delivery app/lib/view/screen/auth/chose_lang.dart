
import 'package:final_delivery/core/localization/local_cotroller.dart';
import 'package:final_delivery/view/widget/auth/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChoseLang extends GetView<LocalCotroller> {
  const ChoseLang({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'lang'.tr,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 30),
            CustumButton(
              text: 'Ar',
              ontap: () {
                controller.changeLang('ar');
              },
            ),
            const SizedBox(height: 30),
            CustumButton(
              text: 'En',
              ontap: () {
                controller.changeLang('en');
              },
            ),
          ],
        ),
      ),
    );
  }
}
