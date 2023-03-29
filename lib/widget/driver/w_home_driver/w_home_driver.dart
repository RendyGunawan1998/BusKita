import '../../../core.dart';

BoxDecoration boxDecorationHomeDriver(
    double radius, Color warna, Color warnaborder) {
  return BoxDecoration(
      borderRadius: BorderRadius.circular(radius),
      color: warna,
      border: Border.all(
        color: warnaborder,
        width: 1.5,
      ));
}

Widget buttonPanjangHomeDriver(String judulButton, Function() opLogin) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Container(
          height: 40,
          width: Get.width * 0.8,
          child: ButtonSubmitHomeDriver(
            onPressed: opLogin,
            title: judulButton,
            icon: Icons.qr_code_scanner_outlined,
            border: 30,
            bgColor: HexColor('#FFF2E2'),
            textColor: HexColor('#F8C178'),
            width: Get.width / 2,
            height: Get.width / 4,
          )),
    ],
  );
}

Widget buttonRow(String image, String judul, Function() fungsi) {
  return InkWell(
    onTap: fungsi,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            height: 80,
            width: Get.width / 4.5,
            decoration: boxDecorationCustomRadiusColor(
                15, HexColor('#FFF2E2'), Colors.white),
            child: Padding(
              padding: EdgeInsets.all(18),
              child: Image.asset(
                image,
              ),
            )),
        hbox(10),
        textOverflowCenter(judul, textStyle14(), TextOverflow.clip),
      ],
    ),
  );
}

Widget buttonRowInvicible(String image, String judul, Function() fungsi) {
  return InkWell(
    onTap: fungsi,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            height: 80,
            width: Get.width / 4.5,
            decoration:
                boxDecorationCustomRadiusColor(15, Colors.white, Colors.white),
            child: Padding(
              padding: EdgeInsets.all(18),
              child: Image.asset(
                image,
                color: Colors.transparent,
              ),
            )),
        hbox(10),
        textOverflowCenter(judul, textStyle14(), TextOverflow.clip),
      ],
    ),
  );
}

Widget rowSpaceBetweenHD(String isi, String isi2, Function() fungsi) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        welcomeText(isi, textStyleReq(Colors.black54, FontWeight.bold, 14)),
        InkWell(
          onTap: fungsi,
          child: Row(
            children: [
              welcomeText(
                  isi2, textStyleReq(Colors.black87, FontWeight.w800, 14)),
              Icon(
                Icons.arrow_forward_ios,
                size: 10,
                color: Colors.black,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget row1() {
  return Padding(
    padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buttonRow('assets/icons/lk.png', 'Lapor\nKejadian', () {
          Get.to(() => LaporKejadianDriver());
        }),
        buttonRow('assets/icons/lkh.png', 'Lapor\nKeluhan', () {
          Get.to(() => LaporKeluhanDriver());
        }),
        buttonRow('assets/icons/ec.png', 'Emergency\nCall', () {
          Get.to(() => EmergencyCallDriver());
        }),
      ],
    ),
  );
}

Widget row2() {
  return Padding(
    padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buttonRow('assets/icons/kas.png', 'Uang Kas', () {
          Get.to(() => UangKasDriver());
        }),
        buttonRowInvicible('assets/icons/armada.png', '', () {
          // Get.to(() => ArmadaDriver());
        }),
        buttonRowInvicible('assets/icons/ec.png', '', () {}),
      ],
    ),
  );
}

Widget riwayatJalanDriver() {
  return Container(
    padding: EdgeInsets.fromLTRB(10, 5, 5, 5),
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
    height: 140,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        rowSpaceBetweenHD('Riwayat Perjalanan', 'Lihat Semua', () {
          Get.to(() => HistoryPerjalananDriver());
        }),
        riwayatLokasiJalanDriver(),
        Padding(
          padding: EdgeInsets.only(right: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                Icons.calendar_month,
                color: HexColor('#F8C178'),
                size: 14,
              ),
              wbox(3),
              welcomeText('20-12-2022',
                  textStyleReq(Colors.black54, FontWeight.w800, 12)),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget riwayatLokasiJalanDriver() {
  return Padding(
    padding: EdgeInsets.only(right: 5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            hbox(15),
            Icon(
              Icons.location_pin,
              size: 20,
              color: CustomColors.krim_custom,
            ),
            hbox(2),
            Dash(
                direction: Axis.vertical,
                length: 10,
                dashLength: 5,
                dashColor: Colors.grey),
            hbox(2),
            Icon(
              Icons.location_pin,
              size: 20,
              color: CustomColors.krim_custom,
            ),
          ],
        ),
        wbox(8),
        Padding(
          padding: EdgeInsets.only(top: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              welcomeText('Kuningan city, Jakarta',
                  textStyleReq(Colors.black, FontWeight.w500, 15)),
              hbox(10),
              welcomeText('Bogor Kota',
                  textStyleReq(Colors.black, FontWeight.w500, 15)),
            ],
          ),
        ),
      ],
    ),
  );
}
