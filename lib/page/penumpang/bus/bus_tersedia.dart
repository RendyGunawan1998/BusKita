import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import '../../../core.dart';

class BusTersediaPenumpang extends StatefulWidget {
  final List list;

  const BusTersediaPenumpang({Key key, this.list}) : super(key: key);

  @override
  _BusTersediaPenumpangState createState() => _BusTersediaPenumpangState();
}

class _BusTersediaPenumpangState extends State<BusTersediaPenumpang> {
  InfinitListRepository repo = InfinitListRepository();
  bool isLoading = true;
  List<PerjalananModel> kendaraanBus = [];
  int idJln;

  @override
  void initState() {
    super.initState();
    kendaraanBus = widget.list;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: appBarPenumpang('Bus Tersedia', () {
          Get.offAll(() => HomePenumpang());
        }),
        body: kendaraanBus == null || kendaraanBus.isEmpty
            ? NoDataWidget()
            : Container(
                height: Get.height,
                width: Get.width,
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    hbox(10),
                    _bodyDataBus(),
                  ],
                ),
              ),
      ),
    );
  }

  Widget _bodyDataBus() {
    final f = DateFormat('HH:MM dd-MM-yyyy');
    return ListView.builder(
        shrinkWrap: true,
        itemCount: kendaraanBus.length,
        itemBuilder: (context, i) {
          return InkWell(
            onTap: () {
              int idJlan = kendaraanBus[i].id;
              int idKendaraan = kendaraanBus[i].kendaraan.id;
              print('idJlan :: $idJlan');
              print('idKendaraan :: $idKendaraan');
              showAlert(idJlan);
            },
            child: listPerjalananBus(
                kendaraanBus[i].kendaraan.nama,
                kendaraanBus[i].rute.rute ?? '-',
                kendaraanBus[i].kendaraan.noPolisi,
                'Keberangkatan : \n${f.format(kendaraanBus[i].waktuKeberangkatan)}',
                'Tiba : \n${f.format(kendaraanBus[i].waktuKeberangkatan)}'),
          );
        });
  }

  showAlert(int id) {
    Widget okButton = TextButton(
        child: Text("Ya"),
        onPressed: () async {
          navigator.pop();
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
                qrCode(data, id);
              } catch (e) {
                print(e);
              }
            });
          }
        });
    Widget cancelButton = TextButton(
        child: Text("Tidak"),
        onPressed: () {
          Navigator.pop(context);
        });
    AlertDialog alert = AlertDialog(
      title: Text("Pemberitahuan"),
      content: Text("Apakah anda yakin memilih bus ini?"),
      actions: [
        okButton,
        cancelButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  qrCode(String hasil, int idPerjalanan) async {
    String url = SCAN_URL;
    print("URL SCAN : $url");

    var _body = {
      "qr": hasil,
      "id_perjalanan": idPerjalanan,
    };
    print('body ::$_body');

    var response = await http.post(
      Uri.parse(url),
      headers: {
        "Accept": "application/json",
        // "Content-Type": "application/json",
        "Authorization": "Bearer " + await getStorage(TOKEN),
      },
      body: json.encode(_body),
    );
    print('header :: ${response.headers}');
    print('res body :: ${response.body}');
    print('S.CODE :: ${response.statusCode}');
    if (response.statusCode == 200) {
      showAlertDialog(context, 'Sukses',
          'Terimakasih sudah check-in . silakan pilih kursi yg masih kosong',
          () {
        Navigator.pop(context);
        Get.offAll(HomePenumpang());
      });
    } else {
      var res = json.decode(response.body);
      print('res gagal :: $res');
      var pesan = res['message'];
      showAlertDialog(context, 'Pemberitahuan', pesan, () {
        Navigator.pop(context);
      });
      //throw Exception('Failed to validate');
    }
  }
}
