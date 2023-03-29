import '../../../core.dart';

class HistoryPerjalananDriver extends StatefulWidget {
  const HistoryPerjalananDriver({Key key}) : super(key: key);

  @override
  _HistoryPerjalananDriverState createState() =>
      _HistoryPerjalananDriverState();
}

class _HistoryPerjalananDriverState extends State<HistoryPerjalananDriver> {
  TextEditingController detail = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarPenumpang('History Perjalanan', () {
        Get.back();
      }),
      body: Container(
          height: Get.height,
          width: Get.width,
          child: Padding(
            padding: EdgeInsets.fromLTRB(5, 15, 5, 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                hbox(10),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0.3, 6.0),
                          color: Colors.grey.withOpacity(0.5),
                          blurRadius: 10,
                        ),
                      ]),
                  width: Get.width * 0.85,
                  height: 110,
                  child: Column(
                    children: [
                      containerCode(),
                      riwayatHistoryPerjalanan(),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }

  Widget containerCode() {
    return Container(
      height: 27,
      width: Get.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        color: CustomColors.krim_custom,
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 4, 12, 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            welcomeText('#01519270512',
                textStyleReq(Colors.white70, FontWeight.bold, 14)),
          ],
        ),
      ),
    );
  }
}
