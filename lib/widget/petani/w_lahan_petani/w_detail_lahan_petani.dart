import '../../../core.dart';

Widget rowDetailLahanFoto() {
  return Padding(
    padding: const EdgeInsets.all(10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 5,
          child: Container(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child:
                  // urlPicture == null
                  //     ?  Image(
                  //         image: NetworkImage(urlPicture),
                  //         fit: BoxFit.cover,
                  //       ) :
                  Image(
                image: AssetImage("assets/images/berita.jpeg"),
                fit: BoxFit.cover,
              ),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            height: 100,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          flex: 5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              welcomeText(
                //  data.nama ?? "Nama Kosong",
                'Lahan Serpong',
                textStyle16(),
              ),
              welcomeText(
                //  " ${formatCurrency.format(
                //   double.tryParse(data.luasLahan),
                // )}  hektar",
                'Luas : 1,2 Hektar',
                textStyle12(),
              ),
              hbox(5),
              welcomeText(
                "Cuaca saat ini",
                textStyle16(),
              ),
              welcomeText(
                //  "$tanggal, $waktu"
                "Senin, 10 Oktober 2022",
                textStyle12(),
              ),
              hbox(5),
              welcomeText(
                "Hujan",
                textStyle16(),
              ),
              welcomeText(
                "33 C",
                textStyle12(),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget listViewWithPerkiraan(Function() op) {
  return ListView.builder(
    // controller: controller,
    shrinkWrap: true,
    itemCount: 2,
    // error
    itemBuilder: (context, i) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(7, 7, 7, 7),
        child: Container(
          height: 80,
          width: Get.width,
          decoration: BoxDecoration(
            color: CustomColors.Text_Abu.withOpacity(0.05),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child:
                        //  _data[i].foto != null
                        //     ? Image(
                        //         image: NetworkImage(
                        //             'https://myseed.id' + _data[i].foto),
                        //         fit: BoxFit.cover,
                        //       )  :
                        Image(
                      image: AssetImage("assets/images/berita.jpeg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  height: 80,
                ),
              ),
              Expanded(
                flex: 7,
                child: Padding(
                  padding: EdgeInsets.only(top: 7, bottom: 7),
                  child: ListTile(
                    title: welcomeText(
                      // _data[i].nama ?? "Nama Kosong"
                      "Umbi",
                      TextStyle(
                          color: CustomColors.Text_Abu,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        hbox(5),
                        welcomeText(
                          //  "Luas : " +
                          // formatCurrency.format(
                          //   double.tryParse(_data[i].luasLahan ?? "0"),
                          // ) +
                          // " hektar"
                          "Luas : 1,2 Hektar",
                          textStyle12(),
                        ),
                        welcomeText(
                          'Perkiraan Panen : 12 Okt 2022',
                          textStyle12(),
                        ),
                      ],
                    ),
                    trailing: IconButton(
                      onPressed: op,
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        color: CustomColors.orange_custom,
                        size: 15,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

Widget rowSpaceBetweenButton(String isi, String isi2, Function() fungsi) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        welcomeText(isi, textStyle16BlackBold()),
        InkWell(
          onTap: fungsi,
          child: welcomeText(
              isi2,
              TextStyle(
                  fontSize: 14,
                  decoration: TextDecoration.underline,
                  color: Colors.black,
                  fontWeight: FontWeight.w500)),
        ),
      ],
    ),
  );
}
