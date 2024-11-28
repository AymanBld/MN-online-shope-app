import 'package:final_delivery/controller/home/order_details_ctrl.dart';
import 'package:final_delivery/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class ProductTable extends GetView<OrderDetailsCtrl> {
  const ProductTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        const TableRow(
          children: [
            Text(
              'Product',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColor.primryColorDark,
              ),
            ),
            Text(
              'Contity',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColor.primryColorDark,
              ),
            ),
            Text(
              'Price',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColor.primryColorDark,
              ),
            ),
          ],
        ),
        ...List.generate(
          controller.orderProducts.length,
          (index) => TableRow(
            children: [
              Text(
                controller.orderProducts[index]['product_name'].toString(),
                textAlign: TextAlign.center,
              ),
              Text(
                controller.orderProducts[index]['cart_pr_contity'].toString(),
                textAlign: TextAlign.center,
              ),
              Text(
                controller.orderProducts[index]['product_discount_price'].toString(),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
