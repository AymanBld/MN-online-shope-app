import 'package:finale/core/class/crud.dart';
import 'package:get/get.dart';

class InitBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
  }
}