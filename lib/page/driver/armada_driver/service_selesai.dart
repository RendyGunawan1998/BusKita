import '../../../core.dart';

class ServiceSelesaiDriver extends StatefulWidget {
  const ServiceSelesaiDriver({Key key}) : super(key: key);

  @override
  _ServiceSelesaiDriverState createState() => _ServiceSelesaiDriverState();
}

class _ServiceSelesaiDriverState extends State<ServiceSelesaiDriver> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarPenumpang('Service', () {
        Get.to(() => ArmadaDriver());
      }),
      body: Container(
        height: Get.height,
        width: Get.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            appBarButtonService(),
            hbox(20),
            Padding(
              padding: EdgeInsets.only(left: 25, right: 25),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 8,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            textOverflow(
                              'Detail : Turun Mesin & Ganti Ban lalalalallalalalalallalalallalal askfnfalssfnalksnfalkf aslkskflaks',
                              textStyle14BlackBold(),
                              TextOverflow.clip,
                            ),
                            welcomeText(
                              'Tanggal : 02-05-2022',
                              textStyle14BlackBold(),
                            ),
                            welcomeText(
                              'Armada : Armada 1',
                              textStyle14BlackBold(),
                            ),
                            welcomeText(
                              'No Pol : B 0293 SMW',
                              textStyle14BlackBold(),
                            ),
                            welcomeText(
                              'Harga : Rp. 8.500.000',
                              textStyle14BlackBold(),
                            ),
                            welcomeText(
                              'Foto : Terlampir',
                              textStyle14BlackBold(),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.remove_red_eye),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  pemisahReq(0, 0, 1, Colors.grey[400])
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget appBarButtonService() {
    return Padding(
      padding: EdgeInsets.only(left: 25, right: 25, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            flex: 5,
            child: InkWell(
              onTap: () {
                Get.to(() => JadwalServiceDriver());
              },
              child: Container(
                height: 50,
                width: Get.width,
                child: Center(
                  child: welcomeText(
                    'Jadwal Service',
                    textStyleReq(Colors.grey, FontWeight.bold, 14),
                  ),
                ),
              ),
            ),
          ),
          wbox(10),
          Expanded(
            flex: 5,
            child: Column(
              children: [
                Container(
                  height: 50,
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: HexColor('#FFF2E2'),
                  ),
                  child: Center(
                      child: welcomeText(
                          'Service Selesai', textStyle14BlackBold())),
                ),
                Container(
                  height: 2.5,
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: CustomColors.krim_custom,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
