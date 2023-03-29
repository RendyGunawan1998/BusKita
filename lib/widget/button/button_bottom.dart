import '../../core.dart';

Widget button_bottom_submit(String judul, Function() op) {
  return Stack(
    alignment: FractionalOffset(.5, 1.0),
    children: [
      Padding(
        padding: EdgeInsets.only(bottom: 20),
        child: SizedBox(
          width: Get.width * 0.9,
          child: TextButton(
            child: welcomeText(
              judul,
              TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white60,
                fontSize: 15,
              ),
            ),
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(CustomColors.orange_custom),
              padding:
                  MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            onPressed: op,
          ),
        ),
      ),
    ],
  );
}

Widget button_bottom_submit_orange_text(String judul, Function() op) {
  return Stack(
    alignment: FractionalOffset(.5, 1.0),
    children: [
      Padding(
        padding: EdgeInsets.only(bottom: 20),
        child: Container(
          width: Get.width * 0.9,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              border: Border.all(
                color: CustomColors.orange_custom,
                width: 1,
              )),
          child: TextButton(
            child: welcomeText(
              judul,
              textStyle16Orange(),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              padding:
                  MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            onPressed: op,
          ),
        ),
      ),
    ],
  );
}

Widget button_bottom_submit_orange_icon_text(
    String judul, IconData icon, Function() op) {
  return Stack(
    alignment: FractionalOffset(.5, 1.0),
    children: [
      Padding(
        padding: EdgeInsets.only(bottom: 20),
        child: Container(
          width: Get.width * 0.9,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            // color: CustomColors.orange_custom,
          ),
          child: TextButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: Colors.black,
                ),
                wbox(5),
                welcomeText(
                  judul,
                  textStyle16BlackBold(),
                ),
              ],
            ),
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(CustomColors.krim_custom),
              padding:
                  MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(14)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
            onPressed: op,
          ),
        ),
      ),
    ],
  );
}
