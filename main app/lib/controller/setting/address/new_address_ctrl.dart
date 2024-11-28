import 'package:finale/core/class/crud.dart';
import 'package:finale/core/constant/links.dart';
import 'package:finale/core/constant/routes.dart';
import 'package:finale/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewAddressCtrl extends GetxController {
  late TextEditingController name;
  late TextEditingController city;
  late TextEditingController street;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  Myservices myservices = Get.find();
  Crud crud = Crud();

  @override
  void onInit() {
    name = TextEditingController();
    city = TextEditingController();
    street = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    name.dispose();
    city.dispose();
    street.dispose();
    super.onClose();
  }

  onSave() {
    if (formkey.currentState!.validate()) {
      Get.toNamed(AppRoutes.addressPosition);
    }
  }

  addAddress() {
    crud.postData(AppLinks.addAdr, {
      'adr_name': name.text,
      'adr_city': city.text,
      'adr_street': street.text,
      'adr_lat': '',
      'adr_long': '',
      'adr_user': myservices.sharedpref.getString('id'),
    });
  }
}
