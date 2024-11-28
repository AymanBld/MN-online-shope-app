import 'package:finale/core/class/crud.dart';
import 'package:finale/core/constant/links.dart';
import 'package:finale/core/services/services.dart';
import 'package:get/get.dart';

class FavoriteCtrl extends GetxController {
  Crud crud = Crud();
  Myservices myservices = Get.find();
  Map productsfav = {};

  changFav(id, val) {
    productsfav[id] = val;
    update();
  }

  removeFav(String id) {
    crud.postData(
      AppLinks.removFav,
      {
        'user_id': myservices.sharedpref.getString('id'),
        'product_id': id,
      },
    );
  }

  addFav(String id) {
    crud.postData(
      AppLinks.addFav,
      {
        'user_id': myservices.sharedpref.getString('id'),
        'product_id': id,
      },
    );
  }
}
