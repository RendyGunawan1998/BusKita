import '../../../core.dart';

Widget lebihBanyakBerita(String judul1, String judul2, Function() fungsi) {
  return Padding(
    padding: EdgeInsets.only(left: 5, top: 7, bottom: 7),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        welcomeText(
          judul1,
          TextStyle(
            color: Colors.grey[700],
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextButton(
          onPressed: fungsi,
          child: welcomeText(
            judul2,
            TextStyle(
              color: Colors.black87,
              fontSize: 14,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget textUmbigo() {
  return Padding(
    padding: EdgeInsets.only(left: 5, top: 7, bottom: 7),
    child: welcomeText(
      "Layanan Umbigo",
      TextStyle(
        color: Colors.grey[700],
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Widget rowPoinPetani() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        flex: 7,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(4),
              child: Container(
                width: Get.width * 0.7,
                height: 40,
                decoration: BoxDecoration(
                  color: HexColor('#FF6633'),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: welcomeText(
                    'Seed Poin : 1.056 biji',
                    TextStyle(
                        color: Colors.grey[300], fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(4),
              child: Container(
                width: Get.width * 0.7,
                height: 40,
                decoration: BoxDecoration(
                  color: HexColor('#FF6633'),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: welcomeText(
                    'Total Lahan : 1,2 Hektar',
                    TextStyle(
                        color: Colors.grey[300], fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      wbox(5),
      Expanded(
        flex: 3,
        child: Container(
          height: 85,
          width: Get.width * 0.3,
          decoration: BoxDecoration(
            color: HexColor('#6B835B'),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20, top: 4),
                child: welcomeText(
                  '10/10/2021',
                  TextStyle(
                      color: Colors.grey[300], fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: welcomeText(
                  'Hujan\n33 C',
                  TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
              )
            ],
          ),
        ),
      )
    ],
  );
}

Widget appBarHomePetani() {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    leading: CircleAvatar(
      backgroundColor: Colors.grey[400],
      child: Center(
        child: Icon(
          Icons.person,
          color: Colors.white,
        ),
      ),
    ),
    title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        welcomeText(
          'Selamat Datang',
          TextStyle(
            color: Colors.black87.withOpacity(0.4),
            fontSize: 12,
          ),
        ),
        welcomeText(
          'Rendy Pangalila',
          TextStyle(
            color: Colors.black87.withOpacity(0.4),
            fontSize: 16,
          ),
        ),
      ],
    ),
    actions: [
      IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.notifications_none_outlined,
            color: Colors.red[400].withOpacity(0.8),
          )),
    ],
  );
}
