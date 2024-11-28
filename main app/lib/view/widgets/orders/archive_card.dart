import 'package:finale/controller/orders/orders_archive_ctrl.dart';
import 'package:finale/core/constant/colors.dart';
import 'package:finale/data/model/order_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class ArchiveCard extends GetView<OrdersArchiveCtrl> {
  final OrderModel rdr;
  const ArchiveCard({
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
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Order code:'),
                    Text('Total price:'),
                    Text('Number of products:'),
                    Text('Order address:'),
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
              children: [
                const Spacer(),
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
