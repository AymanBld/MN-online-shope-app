import 'package:finale/core/constant/routes.dart';
import 'package:finale/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SettingCtrlAll extends GetxController {}

class SettingCtrl extends SettingCtrlAll {
  List<SettingModel> settingList = [
    SettingModel(
      icon: Icons.person_2_outlined,
      title: 'Account',
      onTap: () {},
    ),
    SettingModel(
      icon: Icons.location_on_outlined,
      title: 'Address',
      onTap: () {
        Get.toNamed(AppRoutes.address);
      },
    ),
    SettingModel(
      icon: Icons.list_alt_outlined,
      title: 'Orders',
      onTap: () {
        Get.toNamed(AppRoutes.orders);
      },
    ),
    SettingModel(
      icon: Icons.archive_outlined,
      title: 'Archiv',
      onTap: () {
        Get.toNamed(AppRoutes.archiv);
      },
    ),
    SettingModel(
      icon: Icons.notifications_none,
      title: 'Disable notification',
    ),
    SettingModel(
      icon: Icons.contacts_outlined,
      title: 'Contact us',
    ),
    SettingModel(
      icon: Icons.language_outlined,
      title: 'Language',
    ),
    SettingModel(
      icon: Icons.nightlight_outlined,
      title: 'Theme',
    ),
    SettingModel(
      icon: Icons.lock_outline,
      title: 'Privacy and Security',
    ),
    SettingModel(
      icon: Icons.logout,
      title: 'Log out',
      onTap: () {
        Myservices myservices = Get.find();
        myservices.sharedpref.clear();
        myservices.sharedpref.setInt('step', 1);
        Get.offAllNamed(AppRoutes.login);
      },
    ),
  ];
}

class SettingModel {
  final IconData icon;
  final String title;
  final void Function()? onTap;
  SettingModel({required this.icon, required this.title, this.onTap});
}
