import 'package:finale/core/class/crud.dart';
import 'package:finale/core/constant/links.dart';

class VerifyCodeData {
  Crud crud;
  VerifyCodeData(this.crud);

  Future<Map> verifySignupRequest(String email, String code) async {
    Map response = await crud.postData(
      AppLinks.verifyCodeSignup,
      {
        'user_email': email,
        'user_verifycode': code,
      },
    );
    return response;
  }

  Future<Map> verifyResetRequest(String email, String code) async {
    Map response = await crud.postData(
      AppLinks.verifyCodeReset,
      {
        'user_email': email,
        'user_verifycode': code,
      },
    );
    return response;
  }
}
