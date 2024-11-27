import 'package:finale/controller/home/categories_ctrl.dart';
import 'package:finale/core/constant/colors.dart';
import 'package:finale/data/model/categories_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListCats extends StatelessWidget {
  const ListCats({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoriesCtrl>(
      builder: (controller) => SizedBox(
        height: 50,
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          scrollDirection: Axis.horizontal,
          itemCount: controller.categories.length,
          separatorBuilder: (context, index) => const SizedBox(width: 20),
          itemBuilder: (context, index) {
            CategoriesModel cat = CategoriesModel.fromJson(controller.categories[index]);
            return InkWell(
              onTap: () {
                controller.changeCat(cat.categorieId!);
              },
              child: Text(
                cat.categorieName!,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: cat.categorieId == controller.selectedcat
                      ? AppColor.primryColor
                      : Colors.black,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
