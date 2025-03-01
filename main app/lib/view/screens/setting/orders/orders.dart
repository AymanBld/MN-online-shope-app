import 'package:finale/controller/orders/order_ctrl.dart';
import 'package:finale/core/constant/colors.dart';
import 'package:finale/data/model/order_model.dart';
import 'package:finale/view/widgets/orders/order_card.dart';
import 'package:finale/view/widgets/onboarding/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Orders extends StatelessWidget {
  const Orders({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: const CustumAppBar(title: 'Orders'),
      body: GetBuilder<OrderCtrl>(
        init: OrderCtrl(),
        builder: (controller) => ListView.separated(
          itemCount: controller.ordersList.length,
          separatorBuilder: (context, index) => const SizedBox(height: 10),
          itemBuilder: (context, index) {
            OrderModel ordr = OrderModel.fromJson(controller.ordersList[index]);
            return OrderCard(rdr: ordr);
          },
        ),
      ),
    );
  }
}
