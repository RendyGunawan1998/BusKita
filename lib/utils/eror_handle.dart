import '../core.dart';

Map<String, dynamic> handleErrorJson(dynamic response) {
  Map<String, dynamic> err = <String, dynamic>{};
  print('s.code error :: ${response.statusCode}');
  if (response.statusCode == 401 || response.statusCode == 403) {
    final data = json.decode(response.body);
    err = {
      "status": response.statusCode,
      "detail": data["message"] ?? "Unauthenticated."
    };

    // // set auth state to UnAuthenticated
    // final AuthController _authController = Get.find();
    // _authController.signOut();
    // Get.offAllNamed(SPLASH_SCREEN);
    clearStorage();
    Get.offAll(() => HomePenumpang());
    // #################################
  } else if (response.statusCode == 204) {
    err = {"status": response.statusCode, "detail": "Oops, data is empty"};
  } else if (response.statusCode == 500) {
    err = {"status": response.statusCode, "detail": "Oops, server trouble"};
  } else {
    final data = json.decode(response.body);
    err = {
      "status": response.statusCode,
      "detail": data["detail"] ?? "Oops, an error occurred"
    };
  }

  print("###########-API-#############");
  print("status: ${err['status']}");
  print("detail: ${err['message']}");
  print("#############################");

  return err;
}
