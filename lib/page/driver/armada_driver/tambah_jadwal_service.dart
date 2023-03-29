import 'dart:io';

import 'package:intl/intl.dart';

import '../../../core.dart';

class CreateJadwalService extends StatefulWidget {
  const CreateJadwalService({Key key}) : super(key: key);

  @override
  _CreateJadwalServiceState createState() => _CreateJadwalServiceState();
}

class _CreateJadwalServiceState extends State<CreateJadwalService> {
  TextEditingController tgl = TextEditingController();
  TextEditingController nopol = TextEditingController();
  TextEditingController detailService = TextEditingController();
  String armada;
  GlobalKey formKey;

  DateTime first = DateTime.now();
  DateTime last = DateTime(DateTime.now().year + 7);

  File _selectedImage;
  final picker = ImagePicker();

  List listArmada = [
    'Terminal A1',
    'Terminal B1',
    'Terminal C1',
  ];

  @override
  void initState() {
    super.initState();
  }

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarPenumpang('Input Jadwal Service', () {
        Get.back();
      }),
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(color: Colors.white),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Form(
            key: formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    hbox(10),
                    dropDownService(
                        validateForm,
                        'Armada',
                        listArmada
                            .map((value) => DropdownMenuItem(
                                  child: Text(value),
                                  value: value,
                                ))
                            .toList(), (value) {
                      setState(() {
                        armada = value;
                        printer(armada);
                      });
                    }, armada),
                    hbox(10),
                    Row(
                      children: [
                        Expanded(
                            flex: 5,
                            child: tffServiceIcon('Tanggal', tgl, validateForm,
                                () async {
                              final DateTime picked = await showDatePicker(
                                context: context,
                                initialDate: first,
                                firstDate: first,
                                lastDate: last,
                                confirmText: "Pilih",
                                cancelText: "Batal",
                              );
                              if (picked != null) {
                                setState(() {
                                  var format = DateFormat("dd-MM-yyyy");
                                  var formatted = format.format(
                                      DateTime.parse(picked.toString()));
                                  String tglTemp = formatted.toString();
                                  tgl.text = tglTemp;
                                  print('tgl service :: ${tgl.text}');
                                });
                              }
                            })),
                        wbox(10),
                        Expanded(
                            flex: 5,
                            child: tffService('No. Pol', nopol, validateForm)),
                      ],
                    ),
                    hbox(10),
                    tffServiceBigLine(
                        'Detail Service', detailService, validateForm),
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
                  ],
                ),
                Align(
                  child: buttonPendekService('Simpan', () {}, () {
                    setState(() {
                      armada = '';
                      tgl.clear();
                      nopol.clear();
                      detailService.clear();
                      _selectedImage = null;
                    });
                  }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
