// Future<bool> checkInternet() async {
//   try {
//     final result = await InternetAddress.lookup('google.com');
//     if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
//       return true;
//     }
//     return false;
//   } on SocketException catch (_) {
//     return false;
//   }
// }

Future<bool> checkInternet() async {
  return true;
}
