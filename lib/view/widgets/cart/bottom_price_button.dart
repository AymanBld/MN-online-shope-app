import 'package:finale/controller/orders/cart_ctrl.dart';
import 'package:finale/core/constant/colors.dart';
import 'package:finale/view/widgets/auth/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomPriceButton extends GetView<CartCtrl> {
  const BottomPriceButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: AppColor.primryColorLight,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GetBuilder<CartCtrl>(
            builder: (controller) => Text(
              '\$ ${controller.totalPrice}',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          SizedBox(
            width: Get.width * 0.4,
            child: CustumButton(
              text: 'Check out',
              ontap: () {
                controller.checkOut();
              },
            ),
          ),
        ],
      ),
    );
  }
}
