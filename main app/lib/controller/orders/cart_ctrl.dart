import 'package:finale/core/class/crud.dart';
import 'package:finale/core/constant/links.dart';
import 'package:finale/core/constant/routes.dart';
import 'package:finale/core/functions/handle_statuss.dart';
import 'package:finale/core/services/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class CartCtrlAll extends GetxController {
  updat(String id, int contity) {}
  remove(String id) {}
  get() {}
  checkCoupon(String coupon) {}
  setTotalPrice() {}
  checkOut() {}
}

class CartCtrl extends CartCtrlAll {
  Crud crud = Crud();
  Myservices myservices = Get.find();
  StatusRequest statusrequest = StatusRequest.loading;
  StatusRequest statusRqCoupon = StatusRequest.failed;
  late TextEditingController couponCtrl;

  List cartProducts = [];
  int totalCount = 0;
  double subTotal = 0;
  double totalPrice = 0;
  int couponDiscount = 0;

  @override
  void onInit() {
    couponCtrl = TextEditingController();
    get();
    super.onInit();
  }

  @override
  void onClose() {
    couponCtrl.dispose();
    super.onClose();
  }

  @override
  updat(id, contity) async {
    Map response = await crud.postData(
      AppLinks.updateCart,
      {
        'user_id': myservices.sharedpref.getString('id'),
        'product_id': id,
        'product_contity': contity.toString()
      },
    );
    return response;
  }

  @override
  remove(id) async {
    await crud.postData(
      AppLinks.removCart,
      {
        'user_id': myservices.sharedpref.getString('id'),
        'product_id': id,
      },
    );
  }

  @override
  get() async {
    Map response = await crud.postData(
      AppLinks.getCart,
      {'user_id': myservices.sharedpref.getString('id')},
    );
    statusrequest = handlingStatus(response);

    if (statusrequest == StatusRequest.success) {
      cartProducts = response['data'];
      totalCount = response['total_count'];
      subTotal = double.parse(response['total_price']);
    } else {
      cartProducts = [];
      totalCount = 0;
      subTotal = 0;
      totalPrice = 0;
    }
    setTotalPrice();
    update();
  }

  @override
  checkCoupon(String coupon) async {
    statusRqCoupon = StatusRequest.loading;
    update();

    Map response = await crud.postData(
      AppLinks.checkCoupon,
      {'coupon_name': coupon},
    );

    statusRqCoupon = handlingStatus(response);

    if (statusRqCoupon == StatusRequest.success) {
      couponDiscount = response['data'][0]['coupon_discount'];
    } else {
      couponDiscount = 0;
    }
    setTotalPrice();
    update();
  }

  @override
  setTotalPrice() {
    double x = subTotal * (1 - couponDiscount / 100);
    totalPrice = double.parse((x.toStringAsFixed(2)));
  }

  @override
  checkOut() {
    if (cartProducts.isNotEmpty) {
      Get.toNamed(
        AppRoutes.checkOut,
        arguments: {
          'total_price': totalPrice,
          'total_count': totalCount,
        },
      );
    }
  }
}
