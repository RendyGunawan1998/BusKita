import '../../../core.dart';

class ArmadaDriver extends StatefulWidget {
  const ArmadaDriver({Key key}) : super(key: key);

  @override
  _ArmadaDriverState createState() => _ArmadaDriverState();
}

class _ArmadaDriverState extends State<ArmadaDriver> {
  TextEditingController detail = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarPenumpang('Armada', () {
        Get.to(() => HomeDriver());
      }),
      body: Container(
          height: Get.height,
          width: Get.width,
          child: Column(
            children: [
              hbox(10),
              Padding(
                padding: EdgeInsets.fromLTRB(18, 10, 18, 10),
                child: Container(
                  height: 70,
                  width: Get.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      border: Border.all(
                        width: 1,
                        color: CustomColors.krim_custom.withOpacity(0.5),
                      )),
                  child: Center(
                    child: welcomeText(
                      'Armada A01',
                      textStyleReq(Colors.black, FontWeight.bold, 30),
                    ),
                  ),
                ),
              ),
              hbox(7),
              Container(
                height: 25,
                width: Get.width,
                decoration: BoxDecoration(
                  color: Colors.blueGrey[300].withOpacity(0.2),
                ),
              ),
              hbox(15),
              containerTap('Service', () {
                Get.to(() => JadwalServiceDriver());
              }),
              containerTap('Cek List kondisi kendaraan', () {}),
            ],
          )),
    );
  }

  Widget containerTap(String judul, Function() ontap) {
    return InkWell(
      onTap: ontap,
      child: Padding(
        padding: EdgeInsets.fromLTRB(18, 7, 18, 5),
        child: Container(
          height: 50,
          width: Get.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              border: Border.all(
                width: 1,
                color: Colors.blueGrey[200],
              )),
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 15, 10, 10),
            child: welcomeText(judul, textStyle18()),
          ),
        ),
      ),
    );
  }
}
