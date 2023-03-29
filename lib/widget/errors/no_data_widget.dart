// ignore_for_file: must_be_immutable

import '../../core.dart';

class NoDataWidget extends StatelessWidget {
  String title;
  String subTitle;
  Color iconColor;
  final bool isSmall;

  NoDataWidget({
    Key key,
    this.title,
    this.subTitle,
    this.iconColor,
    this.isSmall = false,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: isSmall
                  ? getProportionateScreenWidth(100)
                  : getProportionateScreenHeight(180),
              width: isSmall
                  ? getProportionateScreenWidth(100)
                  : getProportionateScreenWidth(180),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(0),
                  child: Image.asset(
                    DEFAULT_NO_DATA,
                    fit: BoxFit.fill,
                    // color: iconColor ?? MyColors.appPrimaryColor.withAlpha(200),
                  )),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 2),
              child: Text(
                title != null ? title : "Tidak Ada Data",
                textAlign: TextAlign.center,
                style: kStylePrimaryText(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                subTitle != null
                    ? subTitle
                    : "Bus tidak tersedia untuk rute ini",
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
