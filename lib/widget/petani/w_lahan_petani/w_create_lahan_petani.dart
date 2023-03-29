import '../../../core.dart';

Widget dropDownBiasa(Function(dynamic) validator, String judul,
    List<dynamic> list1, Function(dynamic) onChanged, String value) {
  return Padding(
    padding: EdgeInsets.fromLTRB(10, 7.5, 10, 7.5),
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      decoration: boxDecorationStyle(),
      child: DropdownButtonFormField(
        decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white))),
        validator: validator,
        isExpanded: true,
        hint: welcomeText(judul, textStyle14()),
        dropdownColor: Colors.white,
        items: list1
            .map((value) => DropdownMenuItem(
                  child: Text(value),
                  value: value,
                ))
            .toList(),
        onChanged: onChanged,
        value: value,
      ),
    ),
  );
}

Widget dropdownClear(
    Function(dynamic) validator,
    String judul,
    List<DropdownMenuItem<dynamic>> items,
    Function(dynamic) onChanged,
    String value) {
  return Padding(
    padding: EdgeInsets.fromLTRB(10, 7.5, 10, 7.5),
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      decoration: boxDecorationStyle(),
      child: DropdownButtonFormField(
        validator: validator,
        hint: welcomeText(judul, textStyle12()),
        dropdownColor: Colors.white,
        items: items,
        onChanged: onChanged,
        value: value,
      ),
    ),
  );
}
