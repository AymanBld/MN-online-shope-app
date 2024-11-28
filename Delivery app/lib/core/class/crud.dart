import 'dart:convert';
import 'package:final_delivery/core/functions/check_internet.dart';
import 'package:http/http.dart' as http;

class Crud {
  Future<Map> postData(String uri, Map body) async {
    try {
      if (await checkInternet()) {
        var response = await http.post(Uri.parse(uri), body: body);

        if (response.statusCode == 200) {
          Map responsebody = jsonDecode(response.body);
          return responsebody;
        } else {
          return {"status": StatusRequest.serverFailed};
        }
      } else {
        return {"status": StatusRequest.internetFailed};
      }
    } catch (e) {
      print('-----------------------$e-----------');
      return {"status": StatusRequest.exceptionFailed};
    }
  }
}

enum StatusRequest {
  loading,
  success,
  failed,
  internetFailed,
  serverFailed,
  exceptionFailed,
}
