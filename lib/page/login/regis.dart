import '../../core.dart';
import 'package:http/http.dart' as http;

class Registasi extends StatefulWidget {
  const Registasi({Key key}) : super(key: key);

  @override
  _RegistasiState createState() => _RegistasiState();
}

class _RegistasiState extends State<Registasi> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nama = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController instansi = TextEditingController();
  TextEditingController notelp = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController repass = TextEditingController();
  TextEditingController alamat = TextEditingController();
  TextEditingController wa1 = TextEditingController();
  TextEditingController wa2 = TextEditingController();
  TextEditingController kodepos = TextEditingController();
  TextEditingController urlWebsite = TextEditingController();
  String tipeUser;
  bool loading = false;
  bool obsecureText1 = true;
  bool obsecureText2 = true;

  List<Map<String, dynamic>> jenisUser = [
    {"display": "Penumpang Harian", "value": "1"},
    {"display": "Penumpang Langganan", "value": "3"},
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.krim_custom,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_left_outlined,
              size: 30,
              color: Colors.black,
            )),
        title: Center(child: welcomeText('Registrasi', textStyle20())),
        titleSpacing: 0,
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        child: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Padding(
            padding: EdgeInsets.all(12),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  hbox(10),
                  tffService('Nama Lengkap', nama, validateForm),
                  hbox(10),
                  tffNumber('Nomor Telepon', notelp, validateForm),
                  hbox(10),
                  tffService('Nama Instansi', instansi, validateForm),
                  hbox(10),
                  tffNumber('Nomor WhatApp 1', wa1, validateForm),
                  hbox(10),
                  tffNumber('Nomor WhatApp 2', wa2, validateForm),
                  hbox(10),
                  tffService('Alamat', alamat, validateForm),
                  hbox(10),
                  tffNumber('Kode Pos', kodepos, validateForm),
                  hbox(10),
                  tffService('Url Website', urlWebsite, validateForm),
                  hbox(10),
                  tffService('Username', username, validateForm),
                  hbox(10),
                  tffService('Email', email, validateForm),
                  hbox(10),
                  tffPassPass(
                    'Password',
                    pass,
                    obsecureText1,
                    () {
                      setState(() {
                        obsecureText1 = !obsecureText1;
                      });
                    },
                  ),
                  hbox(10),
                  tffPassPass(
                    'Konfirmasi Password',
                    repass,
                    obsecureText2,
                    () {
                      setState(() {
                        obsecureText2 = !obsecureText2;
                      });
                    },
                  ),
                  hbox(10),
                  dropDownService(
                      validateForm,
                      'Tipe User',
                      jenisUser
                          .map((value) => DropdownMenuItem(
                                child: Text(value['display']),
                                value: value['value'],
                              ))
                          .toList(), (value) {
                    setState(() {
                      tipeUser = value;
                      printer(tipeUser);
                    });
                  }, tipeUser),
                  hbox(10),
                  loading == true
                      ? LoadingAnimationWidget.newtonCradle(
                          color: CustomColors.krim_custom, size: 80)
                      : buttonPanjang('Buat Akun', () async {
                          if (formKey.currentState.validate()) {
                            setState(() {
                              loading = true;
                            });

                            if (pass.text == repass.text) {
                              // print('nama :: ${nama.text}');
                              // print('username :: ${username.text}');
                              // print('email :: ${email.text}');
                              // print('notelp :: ${notelp.text}');
                              // print('pass :: ${pass.text}');
                              // print('repass :: ${repass.text}');
                              // print('wa1 :: ${wa1.text}');
                              // print('wa2 :: ${wa2.text}');
                              // print('kodepos :: ${kodepos.text}');
                              // print('alamat :: ${alamat.text}');
                              // print('kodepos :: ${kodepos.text}');
                              // // print('kode user :: $tipeUser');
                              int kode = int.tryParse(tipeUser);
                              // print('kode :: $kode');
                              String url = REGISTRASI_URL;
                              print("URL REGIS : $url");

                              var _body = {
                                'nama_lengkap': nama.text,
                                'username': username.text,
                                'nama_perusahaan': instansi.text,
                                'email': email.text,
                                'no_telp': notelp.text,
                                'password': pass.text,
                                'conf_password': repass.text,
                                'no_whatsapp_1': wa1.text,
                                'no_whatsapp_2': wa2.text,
                                'url_website': urlWebsite.text,
                                'alamat': alamat.text,
                                'kode_pos': kodepos.text,
                                'sts_login': kode,
                              };
                              print("BODY REGIS : $_body");

                              var response = await http.post(
                                Uri.parse(url),
                                body: json.encode(_body),
                                headers: {
                                  "Accept": "application/json",
                                  "Content-Type": "application/json",
                                },
                              );
                              print("[RESPONSE] : ${response.body}");
                              print(
                                  "[RES STATUS CODE] :: ${response.statusCode}");

                              if (response.statusCode == 201) {
                                print("STATUS REGIS 201");
                                setState(() {
                                  loading = false;
                                });

                                var messages =
                                    'Akun berhasil dibuat, silahkan tekan OK di bawah ini';

                                return showAlertDialogRes(
                                    context, 'Sukses', messages, () {
                                  Navigator.pop(context);
                                  Get.offAll(() => LoginPage());
                                });
                                // return response.body;
                              } else {
                                setState(() {
                                  loading = false;
                                });
                                var res = jsonDecode(response.body);
                                var messages = res['message'];
                                print("[Message] : ${res['message']}");
                                return showAlertDialogRes(
                                    context, 'Alert', messages ?? 'Coba Lagi',
                                    () {
                                  Navigator.pop(context);
                                });
                              }
                            } else {
                              var exitWarning =
                                  "Pastikan password dan konfirmasi password sama";
                              Fluttertoast.showToast(msg: exitWarning);
                              setState(() {
                                loading = false;
                              });
                            }
                          } else {
                            var exitWarning =
                                "Pastikan tidak ada data yang kosong";
                            Fluttertoast.showToast(msg: exitWarning);
                            setState(() {
                              loading = false;
                            });
                          }
                        }),
                  hbox(10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
