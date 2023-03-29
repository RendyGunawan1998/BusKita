import '../../../core.dart';

Widget listPerjalananBus(
  String kodePerjalanan,
  String hargaTiket,
  String sisaKursi,
  String waktuBerangkat,
  String waktuTiba,
) {
  return Padding(
    padding: EdgeInsets.fromLTRB(20, 2, 20, 5),
    child: Container(
      width: Get.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey[400], width: 1),
      ),
      padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: CustomColors.peach_custom,
            ),
            child: Center(
              child: Icon(
                Icons.directions_bus_rounded,
                color: CustomColors.krim_custom,
              ),
            ),
          ),
          wbox(10),
          Expanded(
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      welcomeText(kodePerjalanan, textStyle16BlackBold()),
                      hbox(10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          welcomeText(sisaKursi, textStyle14()),
                          hbox(5),
                          welcomeText(hargaTiket, textStyle14()),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textOverflow(
                          waktuBerangkat,
                          textStyle14(),
                          // textStyleReqWarnaUkuran(
                          //     14, Colors.black87, FontWeight.normal),
                          TextOverflow.clip),
                      hbox(5),
                      textOverflow(
                          waktuTiba,
                          textStyle14(),
                          // textStyleReqWarnaUkuran(
                          //     14, Colors.black87, FontWeight.normal),
                          TextOverflow.clip),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}

Widget listPerjalananDriver(
  String nopol,
  String kodeKendaraan,
  String waktuBerangkat,
  String perkiraan,
) {
  return Padding(
    padding: EdgeInsets.fromLTRB(20, 2, 20, 5),
    child: Container(
      width: Get.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          width: 1.8,
          color: CustomColors.krim_custom,
        ),
      ),
      padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: CustomColors.peach_custom,
            ),
            child: Center(
              child: Icon(
                Icons.directions_bus_rounded,
                color: CustomColors.krim_custom,
              ),
            ),
          ),
          wbox(10),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      welcomeText(nopol, textStyle16BlackBold()),
                      hbox(10),
                      welcomeText(kodeKendaraan, textStyle14()),
                    ],
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textOverflow(
                          waktuBerangkat, textStyle14(), TextOverflow.clip),
                      hbox(5),
                      textOverflow(perkiraan, textStyle14(), TextOverflow.clip),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}
