import 'package:final_delivery/controller/home/navbar_ctrl.dart';
import 'package:final_delivery/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NavbarCtrl());
    return GetBuilder<NavbarCtrl>(
      builder: (controller) => Scaffold(
         backgroundColor: AppColor.backgroundColor,
        body: controller.pages[controller.currentPage][0],
        bottomNavigationBar: BottomAppBar(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          color: AppColor.primryColorDark.withOpacity(0.3),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              controller.pages.length,
              (index) {
                return MaterialButton(
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
       
      ),
    );
  }
}
