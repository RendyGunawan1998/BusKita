import '../../core.dart';

Widget appBarButton(Function() fungsi) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    leading: IconButton(
      onPressed: fungsi,
      icon: const Icon(
        Icons.arrow_back,
        color: Colors.black,
      ),
    ),
  );
}

Widget appBarPenumpang(String judul, Function() fungsi) {
  return AppBar(
    backgroundColor: CustomColors.krim_custom,
    elevation: 0,
    leading: IconButton(
        onPressed: fungsi,
        icon: Icon(
          Icons.arrow_left_outlined,
          size: 30,
          color: Colors.black,
        )),
    title: welcomeText(judul, textStyle20()),
    titleSpacing: 0,
  );
}
