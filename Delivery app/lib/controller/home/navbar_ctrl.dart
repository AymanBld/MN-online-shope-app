import 'package:final_delivery/view/screen/home/accepted_orders.dart';
import 'package:final_delivery/view/screen/home/setting.dart';
import 'package:final_delivery/view/screen/home/waiting_orders.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class NavbarCtrl extends GetxController {
  List pages = [
    [const Center(child: Waiting()), Icons.all_inbox_outlined, 'Waiting'],
    [const Center(child: Accepted()), Icons.list_alt_outlined, 'Accepted'],
    [const Center(child: Setting()), Icons.settings_outlined, 'Setting'],
  ];

  int currentPage = 0;

  changePage(index) {
    currentPage = index;
    update();
  }
}
