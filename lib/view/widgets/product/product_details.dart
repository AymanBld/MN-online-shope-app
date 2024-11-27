import 'package:finale/controller/home/product_ctrl.dart';
import 'package:finale/core/constant/colors.dart';
import 'package:finale/view/widgets/product/counter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetails extends GetView<ProductCtrl> {
  const ProductDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: Get.height * 0.4,
      decoration: const BoxDecoration(
        color: AppColor.primryColorLight,
        borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text(
              controller.pr.productName!,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(controller.pr.productDescription! * 10),
            const SizedBox(height: 10),
            const Counter(),
          ],
        ),
      ),
    );
  }
}
