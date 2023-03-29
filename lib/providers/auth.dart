// import '../core.dart';

// class Auth {
//   cekLoginMain() {
//     Timer(Duration(seconds: 3), () async {
//       var token = await getStorage(TOKEN);
//       print('token :: $token');
//       print(token);
//       if (token != null) {
//         var role = await getStorage(ROLE);
//         print('role :: $role');
//         if (role == 'penumpang') {
//           Get.offAll(() => HomePenumpang());
//         }
//       } else {
//         await removeStorage(TOKEN);
//         Get.offAll(LoginPage());
//       }
//     });
//   }

//   cekLoginHome() {
//     Timer(Duration(seconds: 3), () async {
//       var token = await getStorage(TOKEN);
//       print('token :: $token');
//       print(token);
//       if (token == null) {
//         await removeStorage(TOKEN);
//         Get.offAll(LoginPage());
//       }
//     });
//   }
// }
