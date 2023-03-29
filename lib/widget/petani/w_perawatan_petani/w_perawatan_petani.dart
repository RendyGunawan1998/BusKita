import '../../../core.dart';

Widget subtotalDetailPerawatan(
  String judul1,
  String isi1,
  String judul2,
  String isi2,
  String judul3,
  String isi3,
  String total,
) {
  return Padding(
    padding: EdgeInsets.fromLTRB(10, 2.5, 10, 2.5),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        rowTotalHarga(judul1, isi1),
        rowTotalHarga(judul2, isi2),
        rowTotalHarga(judul3, isi3),
        pemisahPojokKanan(),
        rowTextTotalHarga(total),
      ],
    ),
  );
}

Widget rowTotalHarga(String jenisHarga, String harga) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      welcomeText(jenisHarga, textStyle16Abu()),
      welcomeText(harga, textStyle16Abu()),
    ],
  );
}

Widget rowTextTotalHarga(String harga) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      welcomeText('Total', textStyle16Orange()),
      welcomeText(harga, textStyle16Orange()),
    ],
  );
}
