import '../../../core.dart';

Widget paddingListRiwayat(String asal, String tanggal, String pesan,
    Function() lapor, Function() balas) {
  return Padding(
    padding: EdgeInsets.only(left: 12, right: 12),
    child: ListView.builder(
      shrinkWrap: true,
      itemCount: 1,
      itemBuilder: (context, i) {
        return Padding(
          padding: EdgeInsets.fromLTRB(7, 7, 7, 7),
          child: InkWell(
              onTap: () {
                // Get.to(
                //   () => WebviewLaporanGangguan(
                //     data: _data[i],
                //   ),
                // );
              },
              child:
                  // _data[i].pegawaipenyuluh == null
                  //     ? hbox(0.1) :
                  Container(
                padding: EdgeInsets.all(8),
                width: Get.width,
                decoration: BoxDecoration(
                  color: CustomColors.orange_custom,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(14, 5, 14, 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          welcomeText(
                              //   first + " - Petani",
                              asal,
                              textStyle16PutihAbu()),
                          welcomeText(
                              //  toLocal((_data[i].created).toString()) ?? "-",
                              tanggal,
                              textStyle14PutihAbu())
                        ],
                      ),
                      hbox(10),
                      textOverflow(
                          // _data[i].deskripsi ?? "Data Kosong",
                          pesan,
                          textStyle14PutihAbu(),
                          TextOverflow.clip),
                      pemisahReq(
                        0,
                        0,
                        1,
                        Colors.grey[300],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: lapor,
                            child:
                                welcomeText('Laporkan!', textStyle14PutihAbu()),
                          ),
                          InkWell(
                            onTap: balas,
                            child: welcomeText(
                                'Balasan(1)', textStyle14PutihAbu()),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )),
        );
      },
    ),
  );
}
