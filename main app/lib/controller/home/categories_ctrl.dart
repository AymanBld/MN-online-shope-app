import 'package:finale/core/class/crud.dart';
import 'package:finale/core/constant/links.dart';
import 'package:finale/core/constant/routes.dart';
import 'package:finale/core/functions/handle_statuss.dart';
import 'package:finale/core/services/services.dart';
import 'package:finale/data/model/products_model.dart';
import 'package:get/get.dart';

abstract class CategoriesCtrlAll extends GetxController {
  initData();
  getproducts();
  changeCat(int id);
  onTapCard(ProductModel pr);
}

class CategoriesCtrl extends CategoriesCtrlAll {
  Myservices myservices = Get.find();
  StatusRequest statusrequest = StatusRequest.loading;
  Crud crud = Crud();

  List categories = [];
  List productsOfCat = [];
  late int selectedcat;

  @override
  void onInit() {
    initData();
    super.onInit();
  }

  @override
  initData() {
    categories = Get.arguments['categories'];
    selectedcat = Get.arguments['selected_cat'];
    getproducts();
  }

  @override
  getproducts() async {
    Map response = await crud.postData(
      AppLinks.products,
      {'category_id': '$selectedcat', 'user_id': myservices.sharedpref.getString('id')},
    );
    statusrequest = handlingStatus(response);
    update();

    if (statusrequest == StatusRequest.success) {
      productsOfCat = response['data'];

      update();
    }
  }

  @override
  changeCat(id) {
    selectedcat = id;
    getproducts();
    update();
  }

  @override
  onTapCard(pr) {
    Get.toNamed(
      AppRoutes.product,
      arguments: {'product': pr},
    );
  }
}
