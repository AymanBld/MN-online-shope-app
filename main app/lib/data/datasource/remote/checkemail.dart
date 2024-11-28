import 'package:finale/core/class/crud.dart';
import 'package:finale/core/constant/links.dart';

class CheckEmailData {
  Crud crud;
  CheckEmailData(this.crud);

  Future<Map> postRequest(String email) async {
    Map response =
        await crud.postData(AppLinks.checkEmail, {'user_email': email});
    return response;
  }
}
