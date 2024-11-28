import 'package:finale/core/class/crud.dart';
import 'package:finale/core/constant/links.dart';
import 'package:finale/core/services/services.dart';
import 'package:get/get.dart';

class CheckOutCtrl extends GetxController {
  Myservices myservices = Get.find();
  Crud crud = Crud();

  List addressList = [];
  double totalprice = 0;
  int totalcount = 0;
  int? address;
  int? payment;

  @override
  onInit() {
    getAddress();
    totalprice = Get.arguments['total_price'];
    totalcount = Get.arguments['total_count'];
    super.onInit();
  }

  getAddress() async {
    Map response = await crud.postData(
      AppLinks.getAdr,
      {'user_id': myservices.sharedpref.getString('id')},
    );

    if (response["status"] == 'success') {
      addressList = response['data'];
    }
    update();
  }

  changePayment(int val) {
    payment = val;
    update();
  }

  changeAdr(int value) {
    address = value;
    update();
  }

  buyNow() {
    if (payment != null && address != null) {
      crud.postData(
        AppLinks.orderNow,
        {
          'user_id': myservices.sharedpref.getString('id'),
          'order_price': totalprice.toString(),
          'order_count': totalcount.toString(),
          'order_payment': payment.toString(),
          'order_address': address.toString(),
        },
      );
      Get.back();
      Get.back();
    }
  }
}
