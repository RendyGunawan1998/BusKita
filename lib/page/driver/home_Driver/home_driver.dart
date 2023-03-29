// import 'package:buskita/page/driver/home_Driver/check_in_driver.dart';
import 'package:buskita/model/m_perjalanan_avail_driver.dart';
import 'package:buskita/page/driver/home_Driver/perjalanan_driver.dart';
import 'package:http/http.dart' as http;

import '../../../core.dart';

class HomeDriver extends StatefulWidget {
  const HomeDriver({Key key}) : super(key: key);

  @override
  _HomeDriverState createState() => _HomeDriverState();
}

class _HomeDriverState extends State<HomeDriver> {
  InfinitListRepository repo = InfinitListRepository();
  bool sCekIn = false;
  List<PerjalananAvailModel> perjalananDriver = [];
  String urlPAD = PERJALANAN_AKTIF_DRIVER_URL;
  String nama_user = '';
  String nama = '';
  String nopol = '';
  String rute = '';
  int idkndraan;
  String lat1 = '';
  String lng1 = '';
  String lat2 = '';
  String lng2 = '';
  bool loading = false;

  @override
  void initState() {
    Timer(Duration(milliseconds: 500), () async {
      callNameStat();
      await getPerjalananAktifDriver(urlPAD);
    });
    super.initState();
  }

  callNameStat() async {
    var nama = await getStorage(NAMA_USER);
    bool statCek = await getStatus(STATUS);
    setState(() {
      nama_user = nama;
      sCekIn = statCek;
      print('sCekIn :: $sCekIn');
      print('nama_user :: $nama_user');
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  getPerjalananAktifDriver(String urlApi) async {
    print('URL PEJALANAN AKTIF DRIVER :: $urlApi');

    var data = await repo.listData(urlApi);
    var decode = json.decode(data);
    // print('decode :: $decode');
    if (mounted) {
      setState(() {
        nama = decode['kendaraan']['nama'];
        nopol = decode['kendaraan']['no_polisi'];
        rute = decode['rute']['rute'];
        lat1 = decode['rute']['lat1'];
        lng1 = decode['rute']['lon1'];
        lat2 = decode['rute']['lat2'];
        lng2 = decode['rute']['lon2'];
        idkndraan = decode['kendaraan']['id'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // final f = DateFormat('HH:MM dd-MM-yyyy');
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
                appBarDriver(),
                boxCheckIn(),
                hbox(10),
                row1(),
                hbox(5),
                row2(),
                hbox(10),
                nama != '' &&
                        nama != null &&
                        nopol != '' &&
                        nopol != null &&
                        rute != '' &&
                        rute != null
                    ? Padding(
                        padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                wbox(30),
                                welcomeText(
                                    'Perjalanan', textStyle18BlackBold()),
                              ],
                            ),
                            hbox(5),
                            Padding(
                              padding: EdgeInsets.only(left: 5, right: 5),
                              child: InkWell(
                                onTap: () {
                                  Get.to(() => DataPerjalananDriver(
                                        idKendaraan: idkndraan,
                                        latlng1: LatLng(double.tryParse(lat1),
                                            double.tryParse(lng1)),
                                        latLng2: LatLng(double.tryParse(lat2),
                                            double.tryParse(lng2)),
                                      ));
                                },
                                child: listPerjalananDriver(
                                  rute ?? '',
                                  nama ?? '',
                                  '',
                                  nopol ?? '',
                                ),
                              ),
                            )
                          ],
                        ))
                    : hbox(0),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget appBarDriver() {
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
        title: welcomeText(nama_user ?? 'Halo Driver', textStyle16BlackBold()),
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

  Widget boxCheckIn() {
    return Container(
      decoration:
          boxDecorationHomeDriver(15, Colors.white, CustomColors.krim_custom),
      width: Get.width * 0.85,
      height: 160,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(15, 15, 10, 5),
            height: 90,
            width: Get.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              color: CustomColors.krim_custom,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                welcomeText('Jakarta Kota',
                    textStyleReq(Colors.black, FontWeight.w500, 15)),
                hbox(10),
                welcomeText('Silahkan lakukan Absensi Masuk',
                    textStyleReq(Colors.black, FontWeight.bold, 18)),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 5, 5),
            child: loading == true
                ? Center(
                    child: LoadingAnimationWidget.prograssiveDots(
                        color: CustomColors.krim_custom, size: 25),
                  )
                : buttonPanjangHomeDriver(
                    sCekIn == true ? 'Check-Out' : 'Check-in',
                    sCekIn == true
                        ? () async {
                            setState(() {
                              loading = true;
                            });
                            var idJalan = await getStorage(IDJALAN);
                            print('idJalan :: $idJalan');
                            if (idJalan != null) {
                              var data = await repo.postCheckout('CHECK OUT',
                                  CHECKOUT_URL, int.tryParse(idJalan));
                              print('data post :: $data');
                              if (data == 200) {
                                setState(() {
                                  loading = false;
                                });
                                showAlertDialog(context, 'Sukses',
                                    'Anda berhasil check-out', () async {
                                  await putStatus(STATUS, false);
                                  setState(() {
                                    Navigator.pop(context);
                                    Get.offAll(() => HomeDriver());
                                  });
                                });
                              } else {
                                setState(() {
                                  loading = false;
                                });
                                var exitWarning = "Gagal melakukan check-out";
                                Fluttertoast.showToast(msg: exitWarning);
                              }
                            }
                          }
                        : () async {
                            var data = await RawScanner.scanCode(
                              typeOfCode: BarcodeFormat.qrcode,
                              context: context,
                              centerTitle: false,
                            );

                            if (data != null) {
                              setState(() {
                                data = data;
                                print("hasil scan :: $data");
                                try {
                                  qrCode(data);
                                } catch (e) {
                                  print(e);
                                }
                              });
                            }
                          }),
          ),
        ],
      ),
    );
  }

  qrCode(String hasil) async {
    String url = SCAN_CHECK_IN_DRIVER_URL;
    print("URL SCAN CHECK IN :: $url");

    var _body = {
      "qr": hasil,
    };
    print('body ::$_body');

    var response = await http.post(
      Uri.parse(url),
      headers: {
        "Accept": "application/json",
        "Authorization": "Bearer " + await getStorage(TOKEN),
      },
      body: json.encode(_body),
    );
    // print('header :: ${response.headers}');
    print('res body :: ${response.body}');
    print('S.CODE :: ${response.statusCode}');
    if (response.statusCode == 200) {
      var decode = json.decode(response.body);
      // putStatus(STATUS, true);
      var id = decode['id'];
      print('id kendaraan :: $id');
      if (mounted) {
        setState(() {
          showAlertDialog(context, 'Sukses',
              'Terimakasih sudah check-in . silakan input rute perjalanan dengan tekan tombol OK dibawah',
              () {
            Navigator.pop(context);
            Get.to(() => InputRutePerjalananDriver(
                  qr: hasil,
                ));
          });
        });
      }
    } else {
      var res = json.decode(response.body);
      print('res gagal :: $res');
      var pesan = res['message'];
      showAlertDialog(context, 'Pemberitahuan', pesan, () {
        Navigator.pop(context);
      });
    }
  }
}
