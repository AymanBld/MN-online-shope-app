import 'package:finale/controller/orders/order_ctrl.dart';
import 'package:finale/core/constant/colors.dart';
import 'package:finale/data/model/order_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class OrderCard extends GetView<OrderCtrl> {
  final OrderModel rdr;
  const OrderCard({
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
                    Text('Order status:', style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('${rdr.orderId}'),
                    Text('${rdr.orderPrice}'),
                    Text('${rdr.orderCount}'),
                    Text('${rdr.addressName}'),
                    Text(controller.decodeStatus(rdr.orderStatus!)),
                  ],
                ),
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                rdr.orderStatus == 0
                    ? IconButton(
                        onPressed: () {
                          controller.deleteOrder(rdr.orderId!);
                        },
                        iconSize: 28,
                        color: AppColor.primryColorDark,
                        icon: const Icon(Icons.delete),
                      )
                    : const SizedBox(),
                FilledButton(
                  style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(AppColor.primryColorDark),
                  ),
                  onPressed: () {
                    controller.onOrderDetailsTap(rdr.orderId!);
                  },
                  child: const Text('Detailes'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
