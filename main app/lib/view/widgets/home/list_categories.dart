import 'package:finale/controller/home/home_ctrl.dart';
import 'package:finale/core/constant/colors.dart';
import 'package:finale/data/model/categories_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListCategories extends GetView<HomeCtrl> {
  const ListCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: controller.categories.length,
          separatorBuilder: (context, index) => const SizedBox(width: 10),
          itemBuilder: (context, index) {
            CategoriesModel cat = CategoriesModel.fromJson(controller.categories[index]);
            return InkWell(
              onTap: () {
                controller.onTapCat(cat.categorieId!);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: AppColor.primryColorDark,
                    ),
                    height: 70,
                    width: 70,
                    child: const Icon(Icons.laptop, color: Colors.white, size: 40),
                  ),
                  Text(cat.categorieName!),
                ],
              ),
            );
          }),
    );
  }
}
