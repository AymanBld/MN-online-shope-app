import 'package:get/get.dart';

String? validate(String val, String type, {int? min}) {
  if (val.isEmpty) {
    return 'The field can\'t be empty';
  }
  if (type == 'password' && val.length < min!) {
    return 'the $type should be more than $min';
  }

  if (type == 'username' && !GetUtils.isUsername(val)) {
    return 'username not valid';
  }
  if (type == 'email' && !GetUtils.isEmail(val)) {
    return 'email not valid';
  }
  if (type == 'phone' && !GetUtils.isPhoneNumber(val)) {
    return 'phone not valid';
  }
  return null;
}
