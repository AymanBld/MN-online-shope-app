import 'package:finale/controller/orders/cart_ctrl.dart';
import 'package:finale/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CouponField extends GetView<CartCtrl> {
  const CouponField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: TextField(
            controller: controller.couponCtrl,
            decoration: InputDecoration(
              hintText: 'Coupon',
              hintStyle: const TextStyle(fontSize: 15, color: Colors.grey),
              contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        MaterialButton(
          height: 50,
          onPressed: () {
            controller.checkCoupon(controller.couponCtrl.text);
          },
          child: const Text(
            'Aplay',
            style: TextStyle(
              color: AppColor.primryColorDark,
            ),
          ),
        ),
      ],
    );
  }
}
