import 'package:buskita/page/penumpang/home_penumpang/chat_penumpang.dart';

import '../../../core.dart';
import 'package:http/http.dart' as http;

import '../../../model/m_perjalanan_aktif.dart';
import 'package:buskita/model/m_rute_driver.dart';

class HomePenumpang extends StatefulWidget {
  const HomePenumpang({Key key}) : super(key: key);

  @override
  _HomePenumpangState createState() => _HomePenumpangState();
}

class _HomePenumpangState extends State<HomePenumpang> {
  InfinitListRepository repo = InfinitListRepository();
  List<RuteDriverModel> terminalList = [];
  List<PerjalananModel> perjalananList = [];
  List<PerjalananAktifModel> perjalananAktif = [];
  int jemput, tujuan;
  bool harian = false;
  String nama_user = '';

  @override
  void initState() {
    callNameStat();
    getSts();
    super.initState();
    getListTerminal(RUTE_DRIVER_URL);
    getListPerjalananAktif(PERJALANAN_AKTIF_URL);
  }

  callNameStat() async {
    var nama = await getStorage(NAMA_USER);
    setState(() {
      nama_user = nama;
      print('nama_user :: $nama_user');
    });
  }

  getSts() async {
    var role = await getStorage(ROLE);
    if (role == "1") {
      if (mounted) {
        setState(() {
          harian = true;
        });
      }
    } else {
      if (mounted) {
        setState(() {
          harian = false;
        });
      }
    }
  }

  getListTerminal(String urlApi) async {
    print('URL Rute :: $urlApi');

    var data = await repo.listData(urlApi);
    final decode = json.decode(data);
    final dataList = decode as List;
    var list = dataList.map((rawPost) {
      return RuteDriverModel.fromJson(rawPost);
    }).toList();
    // print("data :: "+data.toString());

    if (mounted) {
      setState(() {
        terminalList.addAll(list);
        print('terminal :: ${terminalList.length}');
      });
    }
  }

  getListPerjalanan(String urlApi) async {
    print('URL Perjalanan :: $urlApi');

    var client = http.Client();

    var token = await getStorage('token');
    print("token:: $token");
    final response = await client.get(
      Uri.parse(urlApi),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
    );
    client.close();

    print('s.code list terminal :: ${response.statusCode}');
    if (response.statusCode < 200 || response.statusCode > 204) {
      print("error :: " + response.toString());
      throw handleErrorJson(response);
    } else if (response.statusCode == 204) {
      Get.snackbar('Message', 'Tidak ada bus yang tersedia di rute ini.');
    } else {
      final decode = json.decode(response.body);
      // print('decode :: $decode');
      final dataList = decode as List;
      var list = dataList.map((rawPost) {
        return PerjalananModel.fromJson(rawPost);
      }).toList();
      // print("data :: "+data.toString());

      if (mounted) {
        setState(() {
          perjalananList.addAll(list);
          // isLoading = false;
          print('perjalanan list :: ${perjalananList.length}');
          Get.to(() => BusTersediaPenumpang(
                list: perjalananList,
              ));
          // _count = decode['count'];
          // next = decode['next'];
        });
      }
    }
  }

  getListPerjalananAktif(String urlApi) async {
    print('URL Perjalanan Aktif :: $urlApi');

    var client = http.Client();

    var token = await getStorage('token');
    print("token:: $token");
    final response = await client.get(
      Uri.parse(urlApi),
      headers: {
        "Accept": "application/json",
        "Authorization": "Bearer $token",
      },
    );
    client.close();

    print('s.code list perjalanan aktif :: ${response.statusCode}');
    if (response.statusCode < 200 || response.statusCode > 204) {
      print("error :: " + response.toString());
      print("error body :: " + response.body);
      throw handleErrorJson(response);
    } else if (response.statusCode == 204) {
      perjalananAktif == null;
      // Get.snackbar('Message', 'Tidak ada bus yang tersedia di rute ini.');
    } else {
      final decode = json.decode(response.body);
      // print('decode :: $decode');
      final dataList = decode as List;
      // print('dataList :: $dataList');
      var list = dataList.map((rawPost) {
        return PerjalananAktifModel.fromJson(rawPost);
      }).toList();
      // print("data :: "+data.toString());

      if (mounted) {
        setState(() {
          perjalananAktif.addAll(list);
          print('perjalanan aktif :: $perjalananAktif');
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Container(
          height: Get.height,
          width: Get.width,
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              children: [
                appBarPenumpang(),
                boxJemputTujuan(),
                row1Penumpang(),
                // buttonRow('assets/icons/lkh.png', 'Chat', () {
                //   Get.to(() => ChatBus());
                // }),
                harian == true ? hbox(0) : row2Penumpang(),
                perjalananAktif != [] ||
                        perjalananAktif.isNotEmpty ||
                        perjalananAktif != null
                    ? Padding(
                        padding: EdgeInsets.only(left: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            welcomeText('Bus', textStyle16BlackBold()),
                          ],
                        ),
                      )
                    : hbox(0),
                hbox(5),
                perjalananAktif != []
                    ? listBus(
                        context,
                        perjalananAktif,
                      )
                    : hbox(0)
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: button_bottom_submit_orange_icon_text(
          'Panic Button', Icons.notifications_active, () {
        Get.to(() => PanicButtonPenumpang());
      }),
    );
  }

  Widget row1Penumpang() {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buttonRow('assets/icons/lk.png', 'Lapor Kejadian', () {
            Get.to(() => LaporKejadianPenumpang());
          }),
          buttonRow('assets/icons/lkh.png', 'Lapor Keluhan', () {
            Get.to(() => LaporKeluhanPenumpang());
          }),
          buttonRow('assets/icons/ec.png', 'Emergency Call', () {
            Get.to(() => EmergencyCall());
          }),
        ],
      ),
    );
  }

  Widget row2Penumpang() {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 5, 15, 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buttonRow('assets/icons/kas.png', 'Uang Kas', () {
            Get.to(() => UangKasPenumpang());
          }),
          buttonRow('assets/icons/lkh.png', 'Chat', () {
            Get.to(() => ChatBus());
          }),
          buttonRowInvicible('assets/icons/ec.png', '', () {}),
        ],
      ),
    );
  }

  Widget buttonRow(String image, String judul, Function() fungsi) {
    return InkWell(
      onTap: fungsi,
      child: Container(
          height: 110,
          width: Get.width / 4,
          decoration: boxDecorationCustomRadiusColor(
              15, HexColor('#FBF5EE'), Colors.white),
          child: Padding(
            padding: EdgeInsets.all(4.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  image,
                  height: 40,
                ),
                hbox(10),
                textOverflowCenter(judul, textStyle14(), TextOverflow.clip),
              ],
            ),
          )),
    );
  }

  Padding appBarPenumpang() {
    return Padding(
      padding: EdgeInsets.only(left: 12),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.grey[400],
          child: Center(
            child: Icon(
              Icons.person,
              color: Colors.white,
            ),
          ),
        ),
        title:
            welcomeText(nama_user ?? 'Halo Penumpang', textStyle16BlackBold()),
        trailing: IconButton(
            onPressed: () async {
              await clearStorage();
              Get.offAll(() => LoginPage());
            },
            icon: Icon(
              Icons.power_settings_new,
              color: Colors.red,
            )),
      ),
    );
  }

  Widget boxJemputTujuan() {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: boxDecorationCustomRadiusColor(
          15, Colors.white, CustomColors.krim_custom),
      width: Get.width * 0.85,
      height: 140,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    hbox(15),
                    Icon(
                      Icons.location_searching,
                      size: 20,
                      color: CustomColors.krim_custom,
                    ),
                    // hbox(2),
                    // Dash(
                    //     direction: Axis.vertical,
                    //     length: 35,
                    //     dashLength: 5,
                    //     dashColor: Colors.grey),
                    // hbox(2),
                    // Icon(
                    //   Icons.location_pin,
                    //   size: 20,
                    //   color: CustomColors.krim_custom,
                    // ),
                  ],
                ),
                wbox(5),
                Expanded(
                  child: Column(
                    children: [
                      dropDownBiasa(
                          validateForm,
                          'Pilih Rute',
                          terminalList
                              .map((value) => DropdownMenuItem(
                                    child: Text(value.rute),
                                    value: value.id,
                                  ))
                              .toList(), (value) {
                        setState(() {
                          jemput = value;
                          printer(jemput.toString());
                        });
                      }, jemput),
                      // hbox(7),
                      // dropDownBiasa(
                      //     validateForm,
                      //     'Lokasi Tujuan',
                      //     terminalList
                      //         .map((value) => DropdownMenuItem(
                      //               child: Text(value.nama),
                      //               value: value.id,
                      //             ))
                      //         .toList(), (value) {
                      //   setState(() {
                      //     tujuan = value;
                      //     printer(tujuan.toString());
                      //   });
                      // }, tujuan),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 5, 5),
            child: buttonPanjang('Cari', () {
              if (jemput != null) {
                getListPerjalanan(RUTE_URL + '$jemput');
              } else {
                Get.snackbar('Pemberitahuan',
                    'Pilih lokasi jemput dan lokasi tujuan terlebih dahulu');
              }
            }),
          ),
        ],
      ),
    );
  }
}
