import 'package:final_delivery/controller/home/accepted_orders_ctrl.dart';
import 'package:final_delivery/core/constant/colors.dart';
import 'package:final_delivery/data/order_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class AcceptedCard extends GetView<AcceptedOrdersCtrl> {
  final OrderModel rdr;
  const AcceptedCard({
    required this.rdr,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      color: AppColor.primryColorLight,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Order code:', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('Total price:', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('Number of products:', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('Order address:', style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('${rdr.orderId}'),
                    Text('${rdr.orderPrice}'),
                    Text('${rdr.orderCount}'),
                    Text('${rdr.addressName}${rdr.addressName}'),
                  ],
                ),
              ],
            ),
            const Divider(),
            FilledButton(
              style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(AppColor.primryColorDark),
              ),
              onPressed: () {
                controller.onOrderDetailsTap(rdr.orderId!);
              },
              child: const Text('Detailes'),
            ),
          ],
        ),
      ),
    );
  }
}
