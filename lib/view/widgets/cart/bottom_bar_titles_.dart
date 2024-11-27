import 'package:finale/controller/orders/cart_ctrl.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class BottomTitles extends GetView<CartCtrl> {
  final String firstTitle;
  final String secondTitle;
  const BottomTitles({
    required this.firstTitle,
    required this.secondTitle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(firstTitle),
          Text(
            secondTitle,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
