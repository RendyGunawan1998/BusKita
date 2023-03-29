import '../../../core.dart';

Widget listViewBudidaya(
    String title, String subtitle1, String subtitle2, Function() op) {
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
            color: CustomColors.AbuBorder,
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
                  padding: EdgeInsets.only(top: 5, bottom: 5),
                  child: ListTile(
                    title: welcomeText(
                      // _data[i].nama ?? "Nama Kosong"
                      title,
                      textStyle16(),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        hbox(3),
                        welcomeText(
                          //  "Luas : " +
                          // formatCurrency.format(
                          //   double.tryParse(_data[i].luasLahan ?? "0"),
                          // ) +
                          // " hektar"
                          subtitle1, textStyle12(),
                        ),
                        welcomeText(
                          subtitle2,
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

Widget listViewDetail(
    String title, String subtitle1, String subtitle2, Function() op) {
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
            color: CustomColors.AbuBorder,
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
                  padding: EdgeInsets.only(top: 5, bottom: 5),
                  child: ListTile(
                    title: welcomeText(
                      // _data[i].nama ?? "Nama Kosong"
                      title,
                      textStyle12(),
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
                          subtitle1, textStyle16(),
                        ),
                        hbox(5),
                        welcomeText(
                          subtitle2,
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

Widget listViewPerawatan(String tanggal, String pupuk, String tanamanSawah,
    String luas, Function() op) {
  return ListView.builder(
    // controller: controller,
    shrinkWrap: true,
    itemCount: 2,
    // error
    itemBuilder: (context, i) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(7, 7, 7, 7),
        child: Container(
          height: 85,
          width: Get.width,
          decoration: BoxDecoration(
            color: CustomColors.AbuBorder,
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
                  height: 95,
                ),
              ),
              Expanded(
                flex: 7,
                child: Padding(
                  padding: EdgeInsets.only(top: 5, bottom: 5),
                  child: ListTile(
                    title: welcomeText(
                      // _data[i].nama ?? "Nama Kosong"
                      tanggal,
                      textStyle12Abu(),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textOverflow(
                          //  "Luas : " +
                          // formatCurrency.format(
                          //   double.tryParse(_data[i].luasLahan ?? "0"),
                          // ) +
                          // " hektar"
                          pupuk, textStyle16(),
                          TextOverflow.ellipsis,
                        ),
                        textOverflow(
                          tanamanSawah,
                          textStyle12(),
                          TextOverflow.ellipsis,
                        ),
                        welcomeText(luas, textStyle12Abu()),
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
