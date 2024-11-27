import 'package:finale/core/class/crud.dart';
import 'package:finale/core/constant/links.dart';

class SignupData {
  Crud crud;
  SignupData(this.crud);

  Future<Map> postRequest(
      String usernam, String email, String pass, String phone) async {
    Map response = await crud.postData(AppLinks.signup, {
      'user_name': usernam,
      'user_email': email,
      'user_pass': pass,
      'user_phone': phone,
    });
    return response;
  }
}
