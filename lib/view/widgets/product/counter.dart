import 'package:finale/controller/home/product_ctrl.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class Counter extends GetView<ProductCtrl> {
  const Counter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            controller.contityToAdd++;
            controller.update();
          },
          icon: const Icon(Icons.add),
        ),
        GetBuilder<ProductCtrl>(
          builder: (controller) => Text('${controller.contityToAdd}'),
        ),
        IconButton(
          onPressed: () {
            if (controller.contityToAdd != 0) {
              controller.contityToAdd--;
              controller.update();
            }
          },
          icon: const Icon(Icons.remove),
        ),
      ],
    );
  }
}
