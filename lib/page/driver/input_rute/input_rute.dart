import 'package:buskita/model/m_perjalanan_avail_driver.dart';
import 'package:intl/intl.dart';
import '../../../core.dart';

class InputRutePerjalananDriver extends StatefulWidget {
  final String qr;
  const InputRutePerjalananDriver({Key key, this.qr}) : super(key: key);

  @override
  _InputRutePerjalananDriverState createState() =>
      _InputRutePerjalananDriverState();
}

class _InputRutePerjalananDriverState extends State<InputRutePerjalananDriver> {
  InfinitListRepository repo = InfinitListRepository();
  List<PerjalananAvailModel> rutePerjalananAvail = [];
  String urlRute = PERJALANAN_AVAIL_DRIVER_URL;
  int ruteJalan;
  TextEditingController jamBerangkat = TextEditingController();

  String qrData;
  TimeOfDay selectedWaktu;
  bool loading = false;

  @override
  void initState() {
    // print('idKendaraan :: $idKendaraan');
    super.initState();
    getListRute(urlRute);
    qrData = widget.qr;
  }

  getListRute(String urlApi) async {
    setState(() {
      loading = true;
    });
    print('URL RUTE :: $urlApi');

    var data = await repo.listData(urlApi);
    if (data != null) {
      final decode = json.decode(data);
      final dataList = decode as List;
      var list = dataList.map((rawPost) {
        return PerjalananAvailModel.fromJson(rawPost);
      }).toList();
      // print("data :: "+data.toString());

      if (mounted) {
        setState(() {
          rutePerjalananAvail.addAll(list);
          loading = false;
          // isLoading = false;
          print('rutePerjalananAvail :: ${rutePerjalananAvail.length}');
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: appBarPenumpang('Pilih Rute Perjalanan', () async {
          await putStatus(STATUS, false);
          Get.offAll(() => HomeDriver());
        }),
        body: Container(
          height: Get.height,
          width: Get.width,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: loading == true
              ? Center(
                  child: LoadingAnimationWidget.bouncingBall(
                      size: 40, color: CustomColors.krim_custom),
                )
              : rutePerjalananAvail == null || rutePerjalananAvail.isEmpty
                  ? Center(
                      child: Container(
                        width: Get.width * 4,
                        child: Text(
                          'Rute Perjalanan Tidak Tersedia\n Silahkan Hubungi Admin Untuk Info Lebih Lanjut',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  : Column(
                      children: [
                        hbox(20),
                        bodyListBus(),
                      ],
                    ),
        ),
      ),
    );
  }

  Widget bodyListBus() {
    final f = DateFormat('HH:MM dd-MM-yyyy');
    return ListView.builder(
        shrinkWrap: true,
        itemCount: rutePerjalananAvail.length,
        itemBuilder: (context, i) {
          return InkWell(
            onTap: () async {
              if (rutePerjalananAvail[i].id != null) {
                print('data oke');
                print('rute jalan :: ${rutePerjalananAvail[i].id}');
                int ruteJalan = rutePerjalananAvail[i].id;
                var data = await repo.postDataRute('RUTE PERJALANAN',
                    INPUT_RUTE_DRIVER_URL, ruteJalan, qrData);
                print('data post :: $data');
                if (data == 200) {
                  showAlertDialog(
                      context, 'Sukses', 'Rute Perjalanan Berhasil Ditambahkan',
                      () async {
                    await putStatus(STATUS, true);
                    await putStorage(IDJALAN, ruteJalan.toString());
                    Navigator.pop(context);

                    Get.offAll(HomeDriver());
                  });
                }
              } else {
                var exitWarning =
                    "Pastikan rute dan waktu keberangkatan tidak kosong";
                Fluttertoast.showToast(msg: exitWarning);
              }
            },
            child: listPerjalananDriver(
                'Rute :\n${rutePerjalananAvail[i].rute.rute ?? '-'}',
                // rutePerjalananAvail[i].kendaraan.noPolisi,
                '',
                'Keberangkatan : \n${f.format(rutePerjalananAvail[i].waktuKeberangkatan)}',
                'Perkiraan Tiba : \n${f.format(rutePerjalananAvail[i].perkiraanWaktuTiba)}'),
          );
        });
  }
}
