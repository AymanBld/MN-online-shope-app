import 'package:finale/controller/orders/cart_ctrl.dart';
import 'package:finale/view/widgets/cart/bottom_bar_titles_.dart';
import 'package:finale/view/widgets/cart/bottom_price_button.dart';
import 'package:finale/view/widgets/cart/coupon_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomBarCart extends StatelessWidget {
  const BottomBarCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartCtrl>(
      builder: (controller) => Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(color: Colors.grey[300]!, blurRadius: 20, offset: const Offset(0, -10))
        ]),
        height: 300,
        width: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const CouponField(),
            BottomTitles(
              firstTitle: 'You have',
              secondTitle: '${controller.totalCount} products',
            ),
            BottomTitles(
              firstTitle: 'Sub total',
              secondTitle: '${controller.subTotal}',
            ),
            BottomTitles(
              firstTitle: 'Discount',
              secondTitle: '${controller.couponDiscount}%',
            ),
            const BottomPriceButton(),
          ],
        ),
      ),
    );
  }
}
