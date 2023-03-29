import 'package:intl/intl.dart';

import '../../../core.dart';

class UangKasPenumpang extends StatefulWidget {
  const UangKasPenumpang({Key key}) : super(key: key);

  @override
  _UangKasPenumpangState createState() => _UangKasPenumpangState();
}

class _UangKasPenumpangState extends State<UangKasPenumpang> {
  InfinitListRepository repo = InfinitListRepository();
  List<Datum> uangKas = [];
  String urlUangKas = UANG_KAS_PENUMPANG_URL;
  String total = "0";

  @override
  void initState() {
    Timer(Duration(seconds: 1), () async {
      await getListUangKas(urlUangKas);
    });
    super.initState();
  }

  getListUangKas(String urlApi) async {
    print('URL Uang Kas Penumpang :: $urlApi');

    var data = await repo.listData(urlApi);
    final decode = json.decode(data);
    total = decode['total'];
    final dataList = decode['data'] as List;
    print('dataList :: $dataList ');
    var list = dataList.map((rawPost) {
      return Datum.fromJson(rawPost);
    }).toList();
    print("list :: " + list.toString());
    if (mounted) {
      setState(() {
        uangKas.addAll(list);
        print('uang kas :: ${uangKas.length}');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarPenumpang('Uang Kas', () {
          Get.back();
        }),
        body: uangKas == []
            ? Center(
                child: Text('Uang kas kosong'),
              )
            : Container(
                height: Get.height,
                width: Get.width,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      hbox(10),
                      Padding(
                        padding: EdgeInsets.fromLTRB(18, 10, 18, 10),
                        child: Container(
                          height: 75,
                          width: Get.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              border: Border.all(
                                width: 1,
                                color:
                                    CustomColors.krim_custom.withOpacity(0.5),
                              )),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(15, 8, 10, 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                welcomeText(
                                  'Total Uang Kas',
                                  textStyleReq(
                                      Colors.black87, FontWeight.w500, 14),
                                ),
                                hbox(5),
                                welcomeText(
                                  'Rp. $total',
                                  textStyleReq(
                                      Colors.black, FontWeight.bold, 30),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          itemCount: uangKas.length,
                          itemBuilder: (context, i) {
                            return Column(
                              children: [
                                hbox(7),
                                containerTgl(
                                  // '12-12-2022',
                                  DateFormat("dd MMM yyyy").format(
                                    uangKas[i].gjlastinput,
                                  ),
                                ),
                                hbox(5),
                                containerTap(
                                  'Rp.${NumberFormat("#,##0").format(uangKas[i].amount)}',
                                  uangKas[i].memo,
                                  (uangKas[i].gjcode).contains('KM')
                                      ? 'Dana Masuk'
                                      : 'Dana Keluar',
                                ),
                                // containerTgl('4 November 2022'),
                                // hbox(5),
                                // containerTap('Rp. 60.000', 'Beli Kopi', 'Dana Keluar'),
                              ],
                            );
                          }),
                    ],
                  ),
                )));
  }

  Widget containerTgl(String tgl) {
    return Container(
      height: 25,
      width: Get.width,
      decoration: BoxDecoration(
        color: Colors.blueGrey[300].withOpacity(0.2),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(18, 4, 10, 4),
        child: welcomeText(tgl, textStyle14()),
      ),
    );
  }

  Widget containerTap(String judul, String keterangan, String status) {
    return Padding(
      padding: EdgeInsets.only(left: 8),
      child: Container(
        width: Get.width,
        child: ListTile(
          title: welcomeText(judul, textStyle18()),
          subtitle: welcomeText(keterangan, textStyle14()),
          trailing: Container(
            height: 30,
            width: 110,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: status == 'Dana Masuk'
                  ? HexColor('#0FA1EF')
                  : HexColor('#F25858'),
            ),
            child: Center(
              child: welcomeText(
                status,
                textStyleReq(Colors.white, FontWeight.normal, 14),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
