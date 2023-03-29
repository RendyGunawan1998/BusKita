import '../../../core.dart';

Widget rowListDetailBudidaya(String input, String isi) {
  return Padding(
    padding: EdgeInsets.fromLTRB(12, 2.5, 12, 2.5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          flex: 5,
          child: Text(
            input,
            style: textStyle14Abu(),
          ),
        ),
        Text(
          ":    ",
          style: textStyle16(),
        ),
        Expanded(
          flex: 5,
          child: Text(
            isi,
            style: textStyle16(),
          ),
        ),
      ],
    ),
  );
}

Widget rowListDetailBudidayaPHP(
    String input, String isi, List<dynamic> items, int value) {
  return Padding(
    padding: const EdgeInsets.only(left: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          flex: 5,
          child: Text(
            input,
            style: textStyle14Abu(),
          ),
        ),
        Text(
          ":    ",
          style: textStyle16(),
        ),
        Expanded(
          flex: 5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: Text(
                  isi,
                  style: textStyle16(),
                ),
              ),
              Expanded(
                flex: 7,
                child: DropdownButtonFormField(
                  iconDisabledColor: Colors.transparent,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                  // dropdownColor: Colors.white,
                  items: items
                      .map((value) => DropdownMenuItem(
                            child: Text(
                              value['name'],
                              style: TextStyle(color: Colors.black54),
                            ),
                            value: value["id"].toString(),
                          ))
                      .toList(),
                  onChanged: null,

                  value: value.toString(),
                ),
              )
            ],
          ),
        ),
      ],
    ),
  );
}
