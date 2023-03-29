// ignore_for_file: file_names

import '../../../core.dart';

Widget riwayatHistoryPerjalanan() {
  return Padding(
    padding: EdgeInsets.only(left: 7, right: 7),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            hbox(15),
            Icon(
              Icons.circle_outlined,
              size: 20,
              color: Colors.black45,
            ),
            hbox(2),
            Dash(
                direction: Axis.vertical,
                length: 10,
                dashLength: 5,
                dashColor: Colors.grey),
            hbox(2),
            Icon(
              Icons.circle_rounded,
              size: 20,
              color: Colors.black54,
            ),
          ],
        ),
        wbox(8),
        Padding(
          padding: EdgeInsets.only(top: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              welcomeText('Jakarta Kota',
                  textStyleReq(Colors.black, FontWeight.w500, 15)),
              hbox(10),
              welcomeText('Bogor Kota',
                  textStyleReq(Colors.black, FontWeight.w500, 15)),
            ],
          ),
        ),
        wbox(65),
        Padding(
          padding: EdgeInsets.only(top: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              welcomeText('02-12-2022',
                  textStyleReq(Colors.grey[400], FontWeight.w500, 15)),
              hbox(10),
              welcomeText('02-12-2022',
                  textStyleReq(Colors.grey[400], FontWeight.w500, 15)),
            ],
          ),
        ),
        wbox(20),
        Padding(
          padding: EdgeInsets.only(top: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              welcomeText(
                  '19.30', textStyleReq(Colors.black87, FontWeight.w500, 15)),
              hbox(10),
              welcomeText(
                  '20.00', textStyleReq(Colors.black87, FontWeight.w500, 15)),
            ],
          ),
        ),
      ],
    ),
  );
}

// Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [

              //     Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
                     
              //       ],
              //     ),
              //   ],
              // ),
