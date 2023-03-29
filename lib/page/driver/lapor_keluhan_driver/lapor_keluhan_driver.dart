import 'dart:io';

import '../../../core.dart';

class LaporKeluhanDriver extends StatefulWidget {
  const LaporKeluhanDriver({Key key}) : super(key: key);

  @override
  _LaporKeluhanDriverState createState() => _LaporKeluhanDriverState();
}

class _LaporKeluhanDriverState extends State<LaporKeluhanDriver> {
  TextEditingController detail = TextEditingController();
  InfinitListRepository repo = InfinitListRepository();
  bool loading = false;

  File _selectedImage;
  final picker = ImagePicker();

  Widget getImageWidget() {
    if (_selectedImage != null) {
      return Image.file(
        _selectedImage,
        width: 200,
        height: 200,
        fit: BoxFit.cover,
      );
    } else {
      return const SizedBox(
        height: 0,
      );
    }
  }

  getImage() async {
    final image = await picker.getImage(
      source: ImageSource.camera,
      maxHeight: 1920,
      maxWidth: 1080,
      imageQuality: 96,
    );
    if (image != null) {
      setState(() {
        _selectedImage = File(image.path);
      });
    } else {
      print("Foto Kosong");
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: appBarPenumpang('Lapor Keluhan', () {
        Get.back();
      }),
      body: Container(
        height: Get.height,
        width: Get.width,
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              hbox(10),
              welcomeText('Detail Kejadian', textStyle16Abu()),
              hbox(10),
              Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: Colors.grey[300],
                        width: 2,
                      )),
                  child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        decoration: InputDecoration(
                            labelText: "Detail Keluhan",
                            border: InputBorder.none),
                        controller: detail,
                        maxLines: 7,
                        onSaved: (value) {
                          detail.text = value;
                        },
                      ))),
              hbox(10),
              welcomeText('Foto Kejadian', textStyle16Abu()),
              hbox(10),
              _selectedImage != null
                  ? Center(child: getImageWidget())
                  : Container(
                      height: Get.height * 0.16,
                      decoration: BoxDecoration(
                        color: Colors.grey[350],
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: InkWell(
                            onTap: () {
                              getImage();
                            },
                            child: Center(
                              child: textOverflowCenter('pilih\ngambar',
                                  textStyle14(), TextOverflow.clip),
                            ),
                          ),
                        ),
                      ),
                    ),
              hbox(25),
              loading == true
                  ? Center(
                      child: LoadingAnimationWidget.prograssiveDots(
                          color: CustomColors.krim_custom, size: 25),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buttonLaporKejadian(
                            'Batal',
                            textStyleReqWarnaUkuran(
                                14, Colors.white70, FontWeight.w500),
                            Colors.grey[800], () {
                          setState(() {
                            detail.clear();
                            _selectedImage = null;
                          });
                        }),
                        buttonLaporKejadian(
                            'Kirim',
                            textStyleReqWarnaUkuran(
                                14, Colors.white70, FontWeight.w500),
                            CustomColors.krim_custom, () async {
                          if (_selectedImage != null && detail.text != '') {
                            setState(() {
                              loading = true;
                            });
                            var data = await repo.postData(
                                'KELUHAN',
                                LAPORAN_KELUHAN,
                                detail.text,
                                _selectedImage.path);
                            print('data post :: $data');
                            if (data == 200) {
                              setState(() {
                                loading = false;
                              });
                              showAlertDialog(context, 'Sukses',
                                  'Terima kasih atas Laporan yang anda berikan',
                                  () {
                                Navigator.pop(context);
                                Get.offAll(HomeDriver());
                              });
                            } else {
                              setState(() {
                                loading = false;
                              });
                            }
                          } else {
                            Get.snackbar('Pesan',
                                'Pastikan foto dan isi laporan tidak kosong');
                          }
                        }),
                      ],
                    )
            ],
          ),
        ),
      ),
    );
  }

  Widget buttonLaporKejadian(
      String judul, TextStyle style, Color warnaBox, Function() fungsi) {
    return InkWell(
      onTap: fungsi,
      child: Container(
        height: 50,
        width: Get.width * 0.43,
        decoration: BoxDecoration(
          color: warnaBox,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: welcomeText(judul, style),
        ),
      ),
    );
  }
}
