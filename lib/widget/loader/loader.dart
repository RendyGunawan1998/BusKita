import '../../core.dart';

class Loader extends StatelessWidget {
  const Loader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
            child: ColorLoader3(
              radius: 20.0,
              dotRadius: 5.0,
            ),
          ),
          Center(child: Text("Please Wait"))
        ],
      ),
      color: Colors.white.withOpacity(0.6),
      // color: Colors.transparent,
    );
  }
}
