import '../../../core.dart';

Widget subJudul(String judul, TextStyle styles) {
  return ListTile(
    title: welcomeText(judul, styles),
    trailing: Icon(
      Icons.location_pin,
      color: HexColor('#FF6633'),
    ),
  );
}

Widget listView(Function() op) {
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
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: CustomColors.Text_Abu.withOpacity(0.3),
              width: 1.5,
            ),
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
                child: ListTile(
                  title: welcomeText(
                    // _data[i].nama ?? "Nama Kosong"
                    "Lahan Serpong",
                    textStyle16(),
                  ),
                  subtitle: welcomeText(
                    //  "Luas : " +
                    // formatCurrency.format(
                    //   double.tryParse(_data[i].luasLahan ?? "0"),
                    // ) +
                    // " hektar"
                    "Luas : 1,2 Hektar",
                    TextStyle(color: CustomColors.Text_Abu),
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
            ],
          ),
        ),
      );
    },
  );
}
