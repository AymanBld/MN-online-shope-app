import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.4,
      padding: const EdgeInsets.all(50),
      child: Image.asset(
        'assets/pngs/iphone.png',
      ),
    );
  }
}
