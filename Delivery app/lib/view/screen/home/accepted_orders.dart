import 'package:final_delivery/controller/home/accepted_orders_ctrl.dart';
import 'package:final_delivery/core/class/handling_states.dart';
import 'package:final_delivery/core/constant/colors.dart';
import 'package:final_delivery/view/widget/auth/app_bar.dart';
import 'package:final_delivery/view/widget/home/accepted_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Accepted extends StatelessWidget {
  const Accepted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: const CustumAppBar(
        title: 'Accepted Orders',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: GetBuilder<AcceptedOrdersCtrl>(
          init: AcceptedOrdersCtrl(),
          builder: (controller) => HandlingStates(
            status: controller.statusrequest,
            widget: ListView.separated(
              itemCount: controller.orders.length,
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemBuilder: (context, index) => AcceptedCard(rdr: controller.orders[index]),
            ),
          ),
        ),
      ),
    );
  }
}
