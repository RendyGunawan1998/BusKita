import 'dart:io';
import '../../core.dart';

Widget hbox(double h) {
  return SizedBox(
    height: h,
  );
}

Widget wbox(double w) {
  return SizedBox(
    width: w,
  );
}

Widget welcomeText(String judul, TextStyle styles) {
  return Text(
    judul,
    style: styles,
  );
}

Widget textOverflow(String judul, TextStyle styles, TextOverflow over) {
  return Text(
    judul,
    style: styles,
    overflow: over,
  );
}

Widget textOverflowCenter(String judul, TextStyle styles, TextOverflow over) {
  return Text(
    judul,
    textAlign: TextAlign.center,
    style: styles,
    overflow: over,
  );
}

TextStyle textStyleReqWarnaUkuran(double size, Color warna, FontWeight fw) {
  return TextStyle(
    color: warna,
    fontSize: size,
    fontWeight: fw,
  );
}

Widget welcomeTextTReqOFAT(
    String judul, TextStyle styles, TextOverflow over, TextAlign ta) {
  return Text(
    judul,
    textAlign: ta,
    style: styles,
    overflow: over,
  );
}

Widget textOverflowKanan(String judul, TextStyle styles, TextOverflow over) {
  return Text(
    judul,
    textAlign: TextAlign.right,
    style: styles,
    overflow: over,
  );
}

Widget pemisah() {
  return Divider(
    thickness: 1.2,
    color: Colors.black54,
    indent: 12,
    endIndent: 12,
  );
}

Widget pemisahReq(double i, double e, double ketebalan, Color warna) {
  return Divider(
    thickness: ketebalan,
    color: warna,
    indent: i,
    endIndent: e,
  );
}

Widget pemisahPojokKanan() {
  return Divider(
    thickness: 1.5,
    color: Colors.grey,
    indent: 250,
  );
}

Widget buttonPanjang(String judulButton, Function() opLogin) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Container(
          height: 40,
          width: Get.width * 0.8,
          child: ButtonSubmitWidget(
            onPressed: opLogin,
            title: judulButton,
            border: 30,
            bgColor: CustomColors.krim_custom,
            textColor: Colors.white60,
            width: Get.width / 2,
            height: Get.width / 4,
          )),
    ],
  );
}

Widget buttonStart(String judulButton, Function() opLogin) {
  return Container(
      height: 40,
      width: Get.width * 0.9,
      child: ButtonSubmitWidget(
        onPressed: opLogin,
        title: judulButton,
        border: 30,
        bgColor: CustomColors.krim_custom,
        textColor: Colors.white60,
        width: Get.width / 2,
        height: Get.width / 4,
      ));
}

Widget buttonPanjangIcon(
    String judulButton, IconData icon, Function() opLogin) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Container(
          height: 40,
          width: Get.width * 0.8,
          child: ButtonSubmitIconWidget(
            icon: icon,
            onPressed: opLogin,
            title: judulButton,
            border: 30,
            bgColor: CustomColors.krim_custom,
            textColor: Colors.white60,
            width: Get.width / 2,
            height: Get.width / 4,
          )),
    ],
  );
}

Widget buttonPendek(String judulButton, Function() opLogin) {
  return Padding(
    padding: EdgeInsets.only(bottom: 8),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
            height: 50,
            width: Get.width * 0.45,
            child: ButtonSubmitWidget(
              onPressed: opLogin,
              title: judulButton,
              border: 10,
              bgColor: HexColor('#FF6633'),
              textColor: Colors.white60,
              width: Get.width / 2,
              height: Get.width / 4,
            )),
      ],
    ),
  );
}

Widget buttonPendekOrangeIcon(
    IconData icon, String judulButton, Function() opLogin) {
  return Padding(
    padding: EdgeInsets.only(bottom: 8),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: 40,
          // width: Get.width * 0.5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ButtonSubmitIconWidget(
                icon: icon,
                onPressed: opLogin,
                title: judulButton,
                border: 10,
                bgColor: CustomColors.krim_custom,
                textColor: Colors.white60,
                width: Get.width / 2.5,
                height: Get.width / 4,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

showAlertDialogRes(
    BuildContext context, String judul, String content, Function fungsi) {
  Widget okButton = TextButton(
    child: Text("OK"),
    onPressed: fungsi,
  );
  AlertDialog alert = AlertDialog(
    title: Text(judul),
    content: Text(
      content,
      style: TextStyle(color: Colors.black),
    ),
    actions: [
      okButton,
    ],
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

Widget loading_loader() {
  return Center(
    child: LoadingAnimationWidget.staggeredDotsWave(
        color: CustomColors.krim_custom, size: 50),
  );
}

TextStyle textStyleReq(Color warna, FontWeight fw, double fs) {
  return TextStyle(
    color: warna,
    fontWeight: fw,
    fontSize: fs,
  );
}

TextStyle textStyle12PutihAbu() {
  return TextStyle(
    color: Colors.white70,
    fontWeight: FontWeight.bold,
    fontSize: 12,
  );
}

TextStyle textStyle14PutihAbu() {
  return TextStyle(
    color: Colors.white70,
    fontWeight: FontWeight.bold,
    fontSize: 14,
  );
}

TextStyle textStyle16PutihAbu() {
  return TextStyle(
    color: Colors.white70,
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );
}

TextStyle textStyle12PutihAbu2() {
  return TextStyle(
    color: Colors.white.withOpacity(0.8),
    fontWeight: FontWeight.bold,
    fontSize: 12,
  );
}

TextStyle textStyle14PutihAbu2() {
  return TextStyle(
    color: Colors.white.withOpacity(0.8),
    fontWeight: FontWeight.bold,
    fontSize: 14,
  );
}

TextStyle textStyle16PutihAbu2() {
  return TextStyle(
    color: Colors.white.withOpacity(0.8),
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );
}

TextStyle textStyle12Orange() {
  return TextStyle(
    color: CustomColors.orange_custom,
    fontWeight: FontWeight.bold,
    fontSize: 12,
  );
}

TextStyle textStyle14Orange() {
  return TextStyle(
    color: CustomColors.orange_custom,
    fontWeight: FontWeight.bold,
    fontSize: 14,
  );
}

TextStyle textStyle16Orange() {
  return TextStyle(
    color: CustomColors.orange_custom,
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );
}

TextStyle textStyle10Abu() {
  return TextStyle(
    color: Colors.grey,
    fontSize: 10,
    fontWeight: FontWeight.w500,
  );
}

TextStyle textStyle12Abu() {
  return TextStyle(
    color: Colors.grey,
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );
}

TextStyle textStyle14Abu() {
  return TextStyle(
    color: Colors.grey,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );
}

TextStyle textStyle16Abu() {
  return TextStyle(
    color: Colors.grey,
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );
}

TextStyle textStyle20Abu() {
  return TextStyle(
    color: Colors.grey,
    fontWeight: FontWeight.bold,
    fontSize: 20,
  );
}

TextStyle textStyle12() {
  return TextStyle(
    color: CustomColors.Text_Abu,
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );
}

TextStyle textStyle14() {
  return TextStyle(
    color: CustomColors.Text_Abu,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );
}

TextStyle textStyle16() {
  return TextStyle(
    color: CustomColors.Text_Abu,
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );
}

TextStyle textStyle18() {
  return TextStyle(
    color: CustomColors.Text_Abu,
    fontWeight: FontWeight.bold,
    fontSize: 18,
  );
}

TextStyle textStyle20() {
  return TextStyle(
      color: CustomColors.Text_Abu, fontWeight: FontWeight.bold, fontSize: 20);
}

TextStyle textStyle12BlackBold() {
  return TextStyle(
    color: Colors.black,
    fontSize: 12,
    fontWeight: FontWeight.w600,
  );
}

TextStyle textStyle14BlackBold() {
  return TextStyle(
    color: Colors.black,
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );
}

TextStyle textStyle16BlackBold() {
  return TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w600,
    fontSize: 16,
  );
}

TextStyle textStyle18BlackBold() {
  return TextStyle(
      color: Colors.black, fontWeight: FontWeight.w600, fontSize: 18);
}

TextStyle textStyle20BlackBold() {
  return TextStyle(
      color: Colors.black, fontWeight: FontWeight.w600, fontSize: 20);
}

TextStyle textStyleBlackBoldReqFont(double font) {
  return TextStyle(
      color: Colors.black, fontWeight: FontWeight.w600, fontSize: font);
}

Widget tffNumberOutput(
    String hint,
    String label,
    TextEditingController controller,
    TextInputType type,
    Function(String) validator) {
  return Padding(
    padding: EdgeInsets.fromLTRB(10, 7.5, 10, 7.5),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.grey[200], spreadRadius: 3),
        ],
      ),
      child: TextFormField(
        inputFormatters: [
          FilteringTextInputFormatter.deny(RegExp(r'[,.]')),
          CurrencyInputFormatter(),
        ],
        keyboardType: type,
        controller: controller,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 20),
          labelStyle: textStyle14(),
          hintStyle: textStyle14(),
          hintText: hint,
          labelText: label,
          border: InputBorder.none,
        ),
        validator: validator,
        onSaved: (value) {
          controller.text = value;
        },
      ),
    ),
  );
}

Widget tffNumber(
    String hint, TextEditingController controller, Function(String) validator) {
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        border: Border.all(
          color: Colors.grey[350],
          width: 1,
        )),
    child: TextFormField(
      inputFormatters: [
        FilteringTextInputFormatter.deny(RegExp(r'[,.]')),
      ],
      keyboardType: TextInputType.number,
      controller: controller,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(left: 20),
        labelStyle: textStyle14Abu(),
        hintStyle: textStyle14Abu(),
        hintText: hint,
        labelText: hint,
        border: InputBorder.none,
      ),
      validator: validator,
      onSaved: (value) {
        controller.text = value;
      },
    ),
  );
}

Widget tffNormal(String hint, String label, TextEditingController controller,
    TextInputType type, Function(String) validator) {
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        border: Border.all(
          color: CustomColors.krim_custom,
          width: 1,
        )),
    child: TextFormField(
      inputFormatters: [
        FilteringTextInputFormatter.deny(RegExp(r'[,.]')),
      ],
      keyboardType: type,
      controller: controller,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(left: 14),
        labelStyle: textStyle14Abu(),
        hintStyle: textStyle14Abu(),
        hintText: hint,
        labelText: label,
        border: InputBorder.none,
      ),
      validator: validator,
      onSaved: (value) {
        controller.text = value;
      },
    ),
  );
}

Widget dropDownBiasa(
    Function(dynamic) validator,
    String judul,
    List<DropdownMenuItem<dynamic>> list1,
    Function(dynamic) onChanged,
    int value) {
  return Padding(
    padding: EdgeInsets.fromLTRB(10, 2.5, 10, 2.5),
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          border: Border.all(
            color: CustomColors.krim_custom,
            width: 1,
          )),
      child: DropdownButtonFormField(
        decoration: InputDecoration(enabledBorder: InputBorder.none),
        validator: validator,
        isExpanded: true,
        hint: welcomeText(judul, textStyle14()),
        dropdownColor: Colors.white,
        items: list1,
        onChanged: onChanged,
        value: value,
      ),
    ),
  );
}

Widget dropDownString(
    Function(dynamic) validator,
    String judul,
    List<DropdownMenuItem<dynamic>> list1,
    Function(dynamic) onChanged,
    String value) {
  return Padding(
    padding: EdgeInsets.fromLTRB(10, 2.5, 10, 2.5),
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          border: Border.all(
            color: CustomColors.krim_custom,
            width: 1,
          )),
      child: DropdownButtonFormField(
        decoration: InputDecoration(enabledBorder: InputBorder.none),
        validator: validator,
        isExpanded: true,
        hint: welcomeText(judul, textStyle14()),
        dropdownColor: Colors.white,
        items: list1,
        onChanged: onChanged,
        value: value,
      ),
    ),
  );
}

String validateForm(value) {
  if (value == null) {
    return "Field tidak boleh kosong";
  } else {
    return null;
  }
}

BoxDecoration boxDecorationStyle() {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: Colors.white,
    boxShadow: [
      BoxShadow(color: Colors.grey[200], spreadRadius: 3),
    ],
  );
}

void printer(String isi) => print('isi :: $isi');

Widget getImageWidget(File selectedImages) {
  if (selectedImages != null) {
    return Image.file(
      selectedImages,
      width: 400,
      height: 300,
      fit: BoxFit.cover,
    );
  } else {
    return SizedBox(
      height: 0,
    );
  }
}
