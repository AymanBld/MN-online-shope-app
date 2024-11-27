import 'package:finale/controller/orders/cart_ctrl.dart';
import 'package:finale/core/constant/colors.dart';
import 'package:finale/data/model/products_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartProduct extends StatelessWidget {
  const CartProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartCtrl>(
      builder: (controller) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: ListView.separated(
          itemCount: controller.cartProducts.length,
          separatorBuilder: (context, index) => const SizedBox(height: 10),
          itemBuilder: (context, index) {
            ProductModel pr = ProductModel.fromJson(controller.cartProducts[index]);
            return Card(
              elevation: 3,
              color: AppColor.primryColorLight,
              child: Row(
                children: [
                  SizedBox(
                    width: 110,
                    child: Image.asset(
                      // pr.productImage!,
                      'assets/pngs/iphone.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  Expanded(
                    child: ListTile(
                      title: Text(pr.productName!),
                      subtitle: Text(pr.productDescription!),
                    ),
                  ),
                  SizedBox(
                    height: 130,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () async {
                            await controller.updat(pr.productId.toString(), 1);
                            await controller.get();
                          },
                          icon: const Icon(
                            Icons.add,
                          ),
                        ),
                        Text(
                          '${pr.cartPrContity}',
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          onPressed: () async {
                            if (pr.cartPrContity == 1) {
                              await controller.remove(pr.productId.toString());
                            } else {
                              await controller.updat(pr.productId.toString(), -1);
                            }
                            await controller.get();
                          },
                          icon: const Icon(Icons.minimize),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
