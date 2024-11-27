import 'package:finale/controller/home/product_ctrl.dart';
import 'package:finale/core/constant/colors.dart';
import 'package:finale/view/widgets/auth/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomProductPrice extends GetView<ProductCtrl> {
  const BottomProductPrice({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: AppColor.primryColorLight,
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GetBuilder<ProductCtrl>(
            builder: (controller) => Text(
              '2 \$',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          SizedBox(
            width: Get.width * 0.4,
            child: CustumButton(
              text: 'Add To Cart',
              ontap: () {
                controller.addToCart();
              },
            ),
          ),
        ],
      ),
    );
  }
}
