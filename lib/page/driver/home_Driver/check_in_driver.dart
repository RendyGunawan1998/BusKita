import '../../../core.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:http/http.dart' as http;

class CheckInDriver extends StatefulWidget {
  const CheckInDriver({Key key}) : super(key: key);

  @override
  _CheckInDriverState createState() => _CheckInDriverState();
}

class _CheckInDriverState extends State<CheckInDriver> {
  MobileScannerController cameraController = MobileScannerController();
  bool found = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          appBarPenumpang(found == false ? 'Scan' : 'Scan Ditemukan', () {}),
      body: MobileScanner(
        allowDuplicates: false,
        controller: cameraController,
        onDetect: (barcode, args) {
          if (barcode.rawValue == null) {
            debugPrint('Failed to scan Barcode');
          } else {
            final String code = barcode.rawValue;
            debugPrint('Barcode found! $code');
            if (mounted) {
              setState(() {
                found = true;
                try {
                  qrCode(code);
                } catch (e) {
                  print(e);
                }
              });
            }
          }
        },
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
              () async {
            await putStatus(STATUS, true);
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
