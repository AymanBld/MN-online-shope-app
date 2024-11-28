import 'package:finale/core/class/crud.dart';
import 'package:finale/core/constant/colors.dart';
import 'package:finale/core/constant/links.dart';
import 'package:finale/core/functions/handle_statuss.dart';
import 'package:finale/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressCtrl extends GetxController {
  Myservices myservices = Get.find();
  StatusRequest statusRequest = StatusRequest.failed;
  Crud crud = Crud();

  List addressList = [];

  @override
  void onInit() {
    getAddress();
    super.onInit();
  }

  getAddress() async {
    statusRequest = StatusRequest.loading;
    update();

    Map response = await crud.postData(
      AppLinks.getAdr,
      {'user_id': myservices.sharedpref.getString('id')},
    );
    statusRequest = handlingStatus(response);
    if (statusRequest == StatusRequest.success) {
      addressList = response['data'];
    }
    update();
  }

  removeAddress(int id, String name) {
    Get.defaultDialog(
      title: 'Attention',
      middleText: 'Do you want to delete your address: \'$name\'',
      contentPadding: const EdgeInsets.all(20),
      buttonColor: AppColor.primryColor,
      onCancel: () {},
      onConfirm: () {
        crud.postData(AppLinks.removAdr, {'adr_id': id.toString()});
        addressList.removeWhere((e) => e['address_id'] == id);
        update();
        Get.back();
      },
    );
  }
}
