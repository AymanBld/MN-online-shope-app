import 'package:finale/view/screens/home/home.dart';
import 'package:finale/view/screens/setting/setting.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavbarCtrl extends GetxController {
  List pages = [
    [const Home(), Icons.home, 'home'],
    [const Center(child: Text('shop')), Icons.shop, 'shope'],
    [const Center(child: Text('account')), Icons.person, 'acccount'],
    [const Center(child: Setting()), Icons.settings, 'setting'],
  ];

  int currentPage = 0;

  changePage(index) {
    currentPage = index;
    update();
  }
}
