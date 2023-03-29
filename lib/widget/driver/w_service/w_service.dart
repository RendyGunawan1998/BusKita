import '../../../core.dart';

Widget buttonPanjangService(String judulButton, Function() opLogin) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Container(
          height: 50,
          width: Get.width * 0.88,
          child: ButtonSubmitWidget(
            onPressed: opLogin,
            title: judulButton,
            border: 10,
            bgColor: CustomColors.krim_custom,
            textColor: Colors.black87,
            width: Get.width / 2,
            height: Get.width / 4,
          )),
    ],
  );
}

Widget dropDownService(
    Function(dynamic) validator,
    String judul,
    List<DropdownMenuItem<dynamic>> list1,
    Function(dynamic) onChanged,
    String value) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 20.0),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        border: Border.all(
          color: Colors.grey[350],
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
  );
}

Widget tffService(
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
      // inputFormatters: [
      //   FilteringTextInputFormatter.deny(RegExp(r'[,.]')),
      // ],
      controller: controller,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(left: 14),
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

Widget tffPassPass(
  String hint,
  TextEditingController passCont,
  bool obs,
  Function() funcPass,
) {
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        border: Border.all(
          color: Colors.grey[350],
          width: 1,
        )),
    child: TextFormField(
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        border: InputBorder.none,
        prefixIcon: Icon(
          Icons.lock,
          color: Colors.grey[400],
        ),
        labelText: hint,
        hintText: hint,
        suffixIcon: IconButton(
          icon: Icon(
            obs ? Icons.visibility_off : Icons.visibility,
            color: Colors.grey[400],
          ),
          onPressed: funcPass,
        ),
      ),
      obscureText: obs,
      validator: validate,
      controller: passCont,
      onSaved: (value) {
        passCont.text = value;
      },
    ),
  );
}

Widget tffServiceBigLine(
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
      maxLines: 5,
      inputFormatters: [
        FilteringTextInputFormatter.deny(RegExp(r'[,.]')),
      ],
      controller: controller,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(left: 14),
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

Widget tffServiceIcon(String hint, TextEditingController controller,
    Function(String) validator, Function() fungsi) {
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
      readOnly: true,
      controller: controller,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        suffixIcon: IconButton(
            onPressed: fungsi, icon: Icon(Icons.calendar_month_outlined)),
        contentPadding: EdgeInsets.only(left: 14),
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

Widget buttonPendekService(
    String judulButton, Function() opLogin, Function() fungsi) {
  return Padding(
    padding: EdgeInsets.only(bottom: 8),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
              onTap: fungsi,
              child: welcomeText(
                'Batal',
                textStyleReq(Colors.grey, FontWeight.w700, 16),
              ),
            ),
            wbox(10),
            Container(
                height: 50,
                width: Get.width * 0.35,
                child: ButtonSubmitWidget(
                  onPressed: opLogin,
                  title: judulButton,
                  border: 10,
                  bgColor: CustomColors.krim_custom,
                  textColor: Colors.black,
                  width: Get.width / 2,
                  height: Get.width / 4,
                )),
          ],
        ),
      ],
    ),
  );
}
