import 'package:final_delivery/controller/home/order_details_ctrl.dart';
import 'package:final_delivery/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressCard extends GetView<OrderDetailsCtrl> {
  const AddressCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColor.backgroundColor,
      elevation: 5,
      child: ListTile(
        title: Text(
          controller.orderProducts[0]['address_name'],
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: AppColor.primryColorDark,
          ),
        ),
        subtitle: Text(
            '${controller.orderProducts[0]['address_street']} - ${controller.orderProducts[0]['address_city']}'),
      ),
    );
  }
}
