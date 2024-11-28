import 'package:finale/controller/home/home_ctrl.dart';
import 'package:finale/core/constant/colors.dart';
import 'package:finale/data/model/products_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductsForYou extends GetView<HomeCtrl> {
  const ProductsForYou({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ProductModel pr;
    return SizedBox(
      height: 150,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: controller.products.length,
          separatorBuilder: (context, index) => const SizedBox(width: 15),
          itemBuilder: (context, index) {
            pr = ProductModel.fromJson(controller.products[index]);
            return Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  'assets/pngs/iphone.png',
                  height: 140,
                  width: 200,
                  fit: BoxFit.contain,
                ),
                Container(
                  width: 210,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      stops: const [0, 0.7],
                      colors: [
                        AppColor.primryColorDark.withOpacity(0.8),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 5,
                  child: Text(
                    pr.productName!,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            );
          }),
    );
  }
}
