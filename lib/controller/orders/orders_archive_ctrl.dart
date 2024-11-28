import 'package:finale/core/class/crud.dart';
import 'package:finale/core/constant/links.dart';
import 'package:finale/core/constant/routes.dart';
import 'package:finale/core/functions/handle_statuss.dart';
import 'package:finale/core/services/services.dart';
import 'package:get/get.dart';

class OrdersArchiveCtrl extends GetxController {
  Crud crud = Crud();
  Myservices myservices = Get.find();
  StatusRequest statusrequest = StatusRequest.loading;

  List ordersList = [];

  @override
  void onInit() {
    getOrders();
    super.onInit();
  }

  getOrders() async {
    Map response = await crud.postData(
      AppLinks.getOrderArchive,
      {'user_id': myservices.sharedpref.getString('id')},
    );

    statusrequest = handlingStatus(response);
    if (statusrequest == StatusRequest.success) {
      ordersList = response['data'];
    }
    update();
  }

  onOrderDetailsTap(int id) {
    Get.toNamed(
      AppRoutes.orderDetails,
      arguments: {'order_id': id},
    );
  }
}
