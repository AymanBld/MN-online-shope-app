import 'package:finale/controller/home/categories_ctrl.dart';
import 'package:finale/view/widgets/home/appbar.dart';
import 'package:finale/view/widgets/categories/grid_products.dart';
import 'package:finale/view/widgets/categories/list_categories.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CategoriesCtrl());
    return const Scaffold(
      appBar: HomeAppBar(),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(children: [
            // HomeAppBar(),
            SizedBox(height: 10),
            ListCats(),
            GridProducts(),
          ]),
        ),
      ),
    );
  }
}
