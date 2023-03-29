import '../../../core.dart';

Widget rowListAdmin(String input, String isi) {
  return Padding(
    padding: EdgeInsets.all(5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          flex: 3,
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
          flex: 7,
          child: SelectableText(
            isi,
            style: textStyle16(),
          ),
        ),
      ],
    ),
  );
}

Widget rowListDataPerjalanan(String input, String isi) {
  return Padding(
    padding: EdgeInsets.all(5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          flex: 4,
          child: Text(
            input,
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
        ),
        Expanded(
          flex: 6,
          child: Text(
            isi,
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.w800,
              fontSize: 16,
            ),
          ),
        ),
      ],
    ),
  );
}
