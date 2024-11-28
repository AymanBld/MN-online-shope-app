import 'package:finale/controller/orders/order_details_ctrl.dart';
import 'package:finale/core/class/handling_states.dart';
import 'package:finale/core/constant/colors.dart';
import 'package:finale/view/widgets/onboarding/app_bar.dart';
import 'package:finale/view/widgets/orders/address_card.dart';
import 'package:finale/view/widgets/orders/product_table.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrderDetailsCtrl());
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: const CustumAppBar(title: 'Order Details'),
      body: GetBuilder<OrderDetailsCtrl>(
        init: OrderDetailsCtrl(),
        builder: (controller) => HandlingStates(
          status: controller.statusrequest,
          widget: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ListView(
              children: [
                Card(
                  color: AppColor.backgroundColor,
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        const ProductTable(),
                        const Divider(),
                        Text(
                          controller.orderPrice.toString(),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                            color: AppColor.primryColorDark,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const AddressCard()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
