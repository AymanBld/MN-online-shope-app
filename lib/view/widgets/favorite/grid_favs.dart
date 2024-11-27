import 'package:finale/controller/my_favorite_ctrl.dart';
import 'package:finale/core/class/handling_states.dart';
import 'package:finale/core/constant/colors.dart';
import 'package:finale/data/model/products_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GridFavorites extends StatelessWidget {
  const GridFavorites({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyFavoriteCtrl>(
      init: MyFavoriteCtrl(),
      builder: (controller) => HandlingStates(
        status: controller.statusrequest,
        widget: Expanded(
          child: GridView.builder(
            itemCount: controller.favProducts.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              childAspectRatio: 0.8,
            ),
            itemBuilder: (context, index) {
              ProductModel pr = ProductModel.fromJson(controller.favProducts[index]);
              return Card(
                // clipBehavior: Clip.hardEdge,
                color: Colors.white,
                elevation: 10,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      color: AppColor.primryColorLight,
                      width: double.infinity,
                      height: 140,
                      padding: const EdgeInsets.all(10),
                      child: Image.asset(
                        'assets/pngs/iphone.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          pr.productName!,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            controller.removeFav(pr.productId!);
                          },
                          icon: const Icon(Icons.favorite),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          '${pr.productDiscountPrice} \$',
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        pr.productDiscount == 0
                            ? const SizedBox()
                            : Text(
                                '${pr.productPrice} \$',
                                style: const TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  decorationColor: Colors.red,
                                  fontSize: 13,
                                  color: Colors.red,
                                ),
                              ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
