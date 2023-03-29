// Project imports:
// ignore_for_file: must_be_immutable

import '../../core.dart';

class ButtonSubmitWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final Color textColor;
  final Color bgColor;
  final double width;
  final double height;
  double border;

  ButtonSubmitWidget({
    Key key,
    this.onPressed,
    this.title,
    this.bgColor,
    this.textColor,
    this.width,
    this.height,
    this.border = 10,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(border)),
      onPressed: onPressed,
      disabledColor: Colors.grey,
      child: Container(
        width: width,
        height: height,
        alignment: Alignment.center,
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: textColor,
            fontSize: 15,
          ),
        ),
      ),
      color: bgColor,
    );
  }
}

class ButtonSubmitIconWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final Color textColor;
  final Color bgColor;
  final double width;
  final double height;
  final IconData icon;
  double border;

  ButtonSubmitIconWidget({
    Key key,
    this.onPressed,
    this.title,
    this.bgColor,
    this.textColor,
    this.width,
    this.height,
    this.icon,
    this.border = 10,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(border)),
      onPressed: onPressed,
      disabledColor: Colors.grey,
      child: Container(
        width: width,
        height: height,
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.white,
            ),
            wbox(5),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: textColor,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
      color: bgColor,
    );
  }
}

class ButtonSubmitHomeDriver extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final IconData icon;
  final Color textColor;
  final Color bgColor;
  final double width;
  final double height;
  double border;

  ButtonSubmitHomeDriver({
    Key key,
    this.onPressed,
    this.title,
    this.icon,
    this.bgColor,
    this.textColor,
    this.width,
    this.height,
    this.border = 10,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(border)),
      onPressed: onPressed,
      disabledColor: Colors.grey,
      child: Container(
        width: width,
        height: height,
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: textColor,
            ),
            wbox(5),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: textColor,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
      color: bgColor,
    );
  }
}
