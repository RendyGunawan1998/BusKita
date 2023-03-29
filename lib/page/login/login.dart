import '../../core.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailTC = TextEditingController();
  TextEditingController passTC = TextEditingController();
  String uuid;

  bool loading = false;
  bool checkedValue = false;
  DateTime currentBackPressTime;
  bool _obsecureText = true;

  final _deviceUuidPlugin = DeviceUuid();

  // @override
  // void setState(fn) {
  //   if (mounted) {
  //     super.setState(fn);
  //   }
  // }

  @override
  void initState() {
    super.initState();
    start();
    // _getId();
    // removeStorage(TOKEN);
    Timer(Duration(seconds: 3), () async {
      var token = await getStorage(TOKEN);
      print('token :: $token');
      if (token != null) {
        var role = await getStorage(ROLE);
        print('role :: $role');
        if (role == '1' || role == '3') {
          Get.offAll(() => HomePenumpang());
        } else {
          Get.offAll(() => HomeDriver());
        }
        // Get.offAll(() => HomeDriver());
      }
      // return null;
    });
  }

  start() async {
    await initPlatformState();
    APP_ONESIGNAL_ACTIVATED
        ? initOneSignal()
        : print("APP_ONESIGNAL_NOT_ACTIVATED");
  }

  Future<void> initPlatformState() async {
    try {
      uuid = await _deviceUuidPlugin.getUUID() ?? 'Unknown uuid version';
      print('uuid :: $uuid');
    } on PlatformException {
      uuid = 'Failed to get uuid version.';
    }

    if (!mounted) return;

    setState(() {});
    return uuid;
  }

  Future<void> initOneSignal() async {
    if (!mounted) return;
    //Remove this method to stop OneSignal Debugging
    OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

    OneSignal.shared.setAppId("f4933570-d764-4f62-b736-2b8df028166b");

    OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {
      print("Accepted permission: $accepted");
    });

    OneSignal.shared
        .setNotificationOpenedHandler((OSNotificationOpenedResult result) {});

    OneSignal.shared.setNotificationWillShowInForegroundHandler(
        (OSNotificationReceivedEvent event) {
      print('FOREGROUND HANDLER CALLED WITH: $event');
      event.complete(event.notification);
    });

    OneSignal.shared.setRequiresUserPrivacyConsent(true);
    OneSignal.shared.consentGranted(true);

    var externalUserId = uuid;
    print('externalUserId :: $externalUserId');
    OneSignal.shared.setExternalUserId(externalUserId);
  }

  // Future<void> cekVersion() async {
  //   PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
  //     String appName = packageInfo.appName;
  //     String packageName = packageInfo.packageName;
  //     String version = packageInfo.version;
  //     String buildNumber = packageInfo.buildNumber;
  //     print(appName);
  //     print(packageName);
  //     print(buildNumber);
  //     print(version);
  //     setState(() {
  //       currentVersion = Version.parse(version);
  //     });
  //     // print("ini currentVersion = $currentVersion");
  //   });
  //   var url = BASE_URL + 'v1/mobile-version/version/get_current_version/';
  //   var response = await http.get(
  //     Uri.parse(url),
  //   );
  //   print('s.code version :: ${response.statusCode}');
  //   //var toJson = jsonDecode(response.body);
  //   if (response.statusCode == 200) {
  //     var tamp = json.decode(response.body);
  //     versi = tamp["mbl_version"];
  //     link = tamp['mbl_link'];
  //     // print("ini link : $link");
  //     latestVersion = Version.parse(versi);
  //     // print("ini latestVersion = $latestVersion");
  //     if (latestVersion > currentVersion) {
  //       print("perlu update");
  //       return _showAlertToUpdate();
  //     } else if (currentVersion == latestVersion) {
  //       print("updated");
  //       // return null;
  //     }
  //     // return latestVersion;
  //   } else {
  //     // return Get.offAll(() => LoginPage());
  //     print("error");
  //   }
  // }
  // _showAlertToUpdate() {
  //   Widget okButton = TextButton(
  //       child: Text("Update"),
  //       onPressed: () {
  //         _launchURL(link);
  //       });
  //   // Widget cancelButton = TextButton(
  //   //     child: Text("Cancel"),
  //   //     onPressed: () {
  //   //       Navigator.pop(context);
  //   //     });
  //   AlertDialog alert = AlertDialog(
  //     title: Text("Pemberitahuan"),
  //     content: Text(
  //         "Ada versi terbaru untuk aplikasi mobile. Segera update ke versi terbaru"),
  //     actions: [
  //       okButton,
  //       // cancelButton,
  //     ],
  //   );
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return alert;
  //     },
  //   );
  // }

  // Future<void> _launchURL(String link) async {
  //   if (!await launchUrl(Uri.parse(link))) {
  //     throw 'Could not launch $link';
  //   }
  // }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
          decoration: BoxDecoration(color: Colors.white),
          height: Get.height,
          width: Get.width,
          child:
              // loading == true ? Loader() :
              bodyLogin(context),
        ),
        bottomNavigationBar: rowDaftar(),
      ),
      onWillPop: () => handleWillPop(context),
    );
  }

  Widget bodyLogin(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            hbox(40),
            Container(
              decoration: BoxDecoration(
                // color: Colors.amber[700],
                borderRadius: BorderRadius.circular(10),
              ),
              height: 150,
              width: 150,
              child: Center(
                child: Image.asset(
                  "assets/images/icon_warna_transparan.png",
                  // width: Get.width * 0.45,
                  // height: 75,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            hbox(10),
            welcomeText(
              'Bus Online',
              textStyleBlackBoldReqFont(38),
            ),
            welcomeText('Login to Your Account', textStyle20BlackBold()),
            hbox(25),
            formsLogin(
              formKey,
              emailTC,
              _obsecureText,
              passTC,
              () {
                setState(() {
                  _obsecureText = !_obsecureText;
                });
              },
              loading,
              () async {
                if (formKey.currentState.validate()) {
                  setState(() {
                    loading = true;
                  });

                  if (emailTC.text != "" && passTC.text != "") {
                    await doLogin(emailTC, passTC, uuid);
                  }
                } else {
                  var exitWarning = "password / email tidak boleh kosong";
                  Fluttertoast.showToast(msg: exitWarning);
                  setState(() {
                    loading = false;
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Future doLogin(TextEditingController email, TextEditingController pass,
      String id) async {
    print('Email :: ${email.text}');
    print('Pass :: ${pass.text}');
    print('id :: $id');
    var url = LOGIN_URL;
    print("URL LOGIN : $url");

    // var _body = {
    //   'email ': email.text,
    //   'password ': pass.text,
    // };
    // print("BODY LOGIN : $_body");

    var request = http.MultipartRequest(
      "POST",
      Uri.parse(url),
    );
    Map<String, String> headers = {
      "Accept": "application/json",
    };

    request.headers.addAll(headers);

    request.fields['email'] = email.text;
    request.fields['password'] = pass.text;
    request.fields['device_id '] = id;

    http.Response response =
        await http.Response.fromStream(await request.send());

    print("[RES HEADER] :: ${response.headers}");
    print("[RES BODY] :: ${response.body}");
    print("[RES STATUS CODE] :: ${response.statusCode}");

    if (response.statusCode == 200) {
      print("LOGIN 200");
      var res = jsonDecode(response.body);
      print("TOKEN :: ${res["token"]}");
      print("ROLE :: ${res["status"]['name']}");
      putStorage(TOKEN, res["token"]);
      putStorage(NAMA_USER, res["nama_lengkap"]);
      putStorage(ROLE, (res["status"]['id']).toString());
      // putStorage(ROLE, res["username"]);

      setState(() {
        loading = false;
      });
      if (res["status"]['id'] == 1 || res["status"]['id'] == 3) {
        Get.offAll(() => HomePenumpang());
      } else {
        Get.offAll(() => HomeDriver());
      }
      // Get.offAll(() => HomeDriver());
      return response.body;
    } else {
      print('S.CODE != 200');
      setState(() {
        loading = false;
      });
      var res = jsonDecode(response.body);
      var messages = res['message'];
      // ignore: prefer_conditional_assignment
      if (messages == null) {
        messages = 'Something wrong';
      }
      print("[Message] : $messages");
      return showAlertDialogOK(context, 'Alert', messages);
    }
  }

  Widget textContinueWith() {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: TextDivider.horizontal(
        text: welcomeText(
          'or continue with',
          TextStyle(
            color: Colors.black.withOpacity(0.6),
            fontWeight: FontWeight.w500,
          ),
        ),
        color: Colors.grey[300],
        thickness: 1.2,
      ),
    );
  }

  Widget rowContinueWith() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        tapContinueWith(() {}, 'assets/icons/fb.png'),
        tapContinueWith(() {}, 'assets/icons/google.png'),
        tapContinueWith(() {}, 'assets/icons/apple.png'),
      ],
    );
  }

  Future<bool> handleWillPop(BuildContext context) async {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: Duration(seconds: 1),
        content: Text("double click for close app"),
      ));
      return Future.value(false);
    }
    return Future.value(true);
  }
}
