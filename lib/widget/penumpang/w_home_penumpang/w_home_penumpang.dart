import 'package:intl/intl.dart';

import '../../../core.dart';
import '../../../model/m_perjalanan_aktif.dart';

BoxDecoration boxDecorationCustomRadiusColor(
    double radius, Color warna, Color warnaborder) {
  return BoxDecoration(
      borderRadius: BorderRadius.circular(radius),
      color: warna,
      border: Border.all(
        color: warnaborder,
        width: 1,
      ));
}

Widget listBus(
  BuildContext context,
  List<PerjalananAktifModel> data,
) {
  final f = DateFormat('HH:MM');
  return Padding(
    padding: EdgeInsets.fromLTRB(20, 2, 20, 5),
    child: ListView.builder(
        shrinkWrap: true,
        itemCount: data.length,
        itemBuilder: (context, i) {
          return InkWell(
            onTap: () {
              Get.to(
                () => DataPerjalananPenumpang(
                  latLngBus: LatLng(
                    double.tryParse(data[i].kendaraan.latitude),
                    double.tryParse(data[i].kendaraan.longitude),
                  ),
                  idKendaraan: data[i].kendaraan.id,
                  cameraPosition: LatLng(
                    double.tryParse(data[i].kendaraan.latitude),
                    double.tryParse(data[i].kendaraan.longitude),
                  ),
                  latlng1: LatLng(double.tryParse(data[i].rute.lat1),
                      double.tryParse(data[i].rute.lon1)),
                  latLng2: LatLng(double.tryParse(data[i].rute.lat2),
                      double.tryParse(data[i].rute.lon2)),
                ),
              );
            },
            child: Container(
              width: Get.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.grey[400], width: 1),
              ),
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          welcomeText(
                              data[i].kendaraan.nama, textStyle16BlackBold()),
                          hbox(5),
                          welcomeText(data[i].kendaraan.kodeKendaraan,
                              textStyle14BlackBold()),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      welcomeText(
                          data[i].kendaraan.noPolisi, textStyle14BlackBold()),
                      welcomeText(f.format(data[i].waktuKeberangkatan),
                          textStyle14BlackBold()),
                    ],
                  ),
                ],
              ),
            ),
          );
        }),
  );
}

Widget listBusWithData(
  String namaBus,
  String nopol,
  int sisa,
) {
  return Padding(
    padding: EdgeInsets.fromLTRB(20, 2, 20, 5),
    child: Container(
      width: Get.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey[400], width: 1),
      ),
      padding: EdgeInsets.all(10),
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              welcomeText(namaBus, textStyle16BlackBold()),
              hbox(5),
              welcomeText(nopol, textStyle14Abu()),
            ],
          )
        ],
      ),
    ),
  );
}
