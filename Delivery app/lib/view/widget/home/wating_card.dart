import 'package:final_delivery/controller/home/waiting_orders_ctrl.dart';
import 'package:final_delivery/core/constant/colors.dart';
import 'package:final_delivery/data/order_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class WatingCard extends GetView<WaitingOrdersCtrl> {
  final OrderModel rdr;
  const WatingCard({
    required this.rdr,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      color: AppColor.primryColorLight,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
                    Text('${rdr.addressName}'),
                  ],
                ),
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FilledButton(
                  style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(AppColor.secondColor),
                  ),
                  onPressed: () {
                    controller.onOrderAccepted(rdr.orderId!);
                  },
                  child: const Text('Accept Order'),
                ),
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
            )
          ],
        ),
      ),
    );
  }
}
