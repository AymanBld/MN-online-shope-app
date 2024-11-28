import 'package:finale/core/class/crud.dart';
import 'package:finale/core/constant/links.dart';
import 'package:finale/core/functions/handle_statuss.dart';
import 'package:finale/core/services/services.dart';
import 'package:get/get.dart';

class MyFavoriteCtrl extends GetxController {
  Crud crud = Crud();
  Myservices myservices = Get.find();
  StatusRequest statusrequest = StatusRequest.loading;

  List favProducts = [];

  @override
  void onInit() {
    getFavorites();
    super.onInit();
  }

  getFavorites() async {
    Map response = await crud.postData(
      AppLinks.getFav,
      {'user_id': myservices.sharedpref.getString('id')},
    );
    statusrequest = handlingStatus(response);

    if (statusrequest == StatusRequest.success) {
      favProducts.addAll(response['data']);
    }
    update();
  }

  removeFav(int id) {
    crud.postData(
      AppLinks.removFav,
      {
        'user_id': myservices.sharedpref.getString('id'),
        'product_id': id.toString(),
      },
    );

    favProducts.removeWhere((pr) => pr['product_id'] == id);

    update();
  }
}
