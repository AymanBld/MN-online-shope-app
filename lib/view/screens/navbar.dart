import 'package:finale/controller/navbar_ctrl.dart';
import 'package:finale/core/constant/colors.dart';
import 'package:finale/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NavbarCtrl());
    return GetBuilder<NavbarCtrl>(
      builder: (controller) => Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(),
          backgroundColor: AppColor.primryColorDark,
          onPressed: () {
            Get.toNamed(AppRoutes.cart);
          },
          child: const Icon(
            Icons.shopping_basket_outlined,
            color: Colors.white,
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 8,
          color: AppColor.primryColorDark.withOpacity(0.3),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              controller.pages.length + 1,
              (i) {
                int index = i > 2 ? i - 1 : i;
                return i == 2
                    ? const Spacer()
                    : MaterialButton(
                        onPressed: () {
                          controller.changePage(index);
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              controller.pages[index][1],
                              size: controller.currentPage == index ? 28 : 23,
                              color: controller.currentPage == index
                                  ? AppColor.primryColorDark
                                  : Colors.grey[700],
                            ),
                            Text(
                              controller.pages[index][2],
                              style: TextStyle(
                                color: controller.currentPage == index
                                    ? AppColor.primryColorDark
                                    : Colors.grey[700],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      );
              },
            ),
          ),
        ),
        backgroundColor: AppColor.backgroundColor,
        body: controller.pages[controller.currentPage][0],
      ),
    );
  }
}
