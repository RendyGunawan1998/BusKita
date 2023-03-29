import 'package:buskita/model/emergency_model.dart';

import '../../../core.dart';

class EmergencyCall extends StatefulWidget {
  const EmergencyCall({Key key}) : super(key: key);

  @override
  _EmergencyCallState createState() => _EmergencyCallState();
}

class _EmergencyCallState extends State<EmergencyCall> {
  InfinitListRepository repo = InfinitListRepository();
  List<EmergencyModel> emergencyList = [];

  @override
  void initState() {
    super.initState();
    getListEmergency(URL_EMERGENCY);
  }

  getListEmergency(String urlApi) async {
    print('URL EMERGENCY :: $urlApi');

    var data = await repo.listData(urlApi);
    final decode = json.decode(data);

    if (mounted) {
      setState(() {
        List<dynamic> list = decode;
        List<EmergencyModel> listdata;
        listdata = list.map((i) => EmergencyModel.fromJson(i)).toList();
        emergencyList.insertAll(0, listdata);
        print('List Emergency :: $emergencyList');
        print('emergencyList :: ${emergencyList.length}');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarPenumpang('Emergency Call', () {
        Get.back();
      }),
      body: Container(
        height: 180,
        width: Get.width,
        child: Padding(
          padding: EdgeInsets.all(15),
          child: emergencyList == null
              ? Text('DATA KOSONG')
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: emergencyList.length,
                  itemBuilder: (context, i) {
                    return Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(15, 10, 10, 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            hbox(10),
                            rowListAdmin(emergencyList[i].nama ?? "Data $i",
                                emergencyList[i].nomor ?? "-"),
                            hbox(5),
                            // rowListAdmin('Admin 2', '0829-2021-xxxx'),
                            // hbox(5),
                            // rowListAdmin('Admin 3', '0829-1234-xxxx'),
                            // hbox(5),
                          ],
                        ),
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
