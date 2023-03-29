// Get the proportionate height as per screen size
import '../core.dart';

double getProportionateScreenHeight(double inputHeight) {
  double screenHeight = Get.height;
  // 812 is the layout height that designer use
  return (inputHeight / 812.0) * screenHeight;
}

// Get the proportionate height as per screen size
double getProportionateScreenWidth(double inputWidth) {
  double screenWidth = Get.width;
  // 375 is the layout width that designer use
  return (inputWidth / 375.0) * screenWidth;
}

/// System overlays should be drawn with a light color. Intended for
/// applications with a dark background.
final SystemUiOverlayStyle mySystemThemeLight = SystemUiOverlayStyle(
  systemNavigationBarColor: Colors.white,
  systemNavigationBarDividerColor: null,
  statusBarColor: null,
  systemNavigationBarIconBrightness: Brightness.light,
  statusBarIconBrightness: Brightness.light,
  statusBarBrightness: Brightness.dark,
);

/// System overlays should be drawn with a dark color. Intended for
/// applications with a light background.
final SystemUiOverlayStyle mySystemThemeDark = SystemUiOverlayStyle(
  systemNavigationBarColor: Colors.white,
  systemNavigationBarDividerColor: null,
  statusBarColor: null,
  systemNavigationBarIconBrightness: Brightness.light,
  statusBarIconBrightness: Brightness.dark,
  statusBarBrightness: Brightness.light,
);

final BoxDecoration bottomAppBarDecoration = BoxDecoration(
  gradient: LinearGradient(
      colors: [MyColors.loginGradientEnd, MyColors.loginGradientStart],
      begin: const FractionalOffset(0.2, 0.2),
      end: const FractionalOffset(1.2, 1.2),
      stops: [0.0, 1.0],
      tileMode: TileMode.clamp),
);

final BoxDecoration bottomAppBarDecorationInspectorFilter = BoxDecoration(
  gradient: LinearGradient(
      colors: [Colors.grey.shade100, Colors.grey.shade200],
      begin: FractionalOffset(0.2, 0.2),
      end: FractionalOffset(1.2, 1.2),
      stops: [0.0, 1.0],
      tileMode: TileMode.clamp),
);

// our default Shadow
const kDefaultShadow = BoxShadow(
  offset: Offset(0, 15),
  blurRadius: 27,
  color: Colors.black12, // Black color with 12% opacity
);

// My Text Styles
TextStyle kStyleHeadingText({Color textColor}) => TextStyle(
      fontSize: 28,
      // fontSize: Get.width * 0.07,
      // fontSize: getProportionateScreenWidth(28),
      color: textColor ?? MyColors.kTextColor,
      fontWeight: FontWeight.bold,
      // height: 1.5,
    );
TextStyle kStyleSubheadingText({Color textColor, bool isBold = false}) =>
    TextStyle(
      fontSize: 24,
      // fontSize: Get.width * 0.06,
      // fontSize: getProportionateScreenWidth(24),
      color: textColor ?? Color(0xFF61688B),
      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      // height: 2,
    );

TextStyle kStyleTitleText({Color textColor}) => TextStyle(
      fontSize: 20,
      // fontSize: Get.width * 0.05,
      // fontSize: getProportionateScreenWidth(20),
      color: textColor ?? MyColors.kTextColor,
      fontWeight: FontWeight.bold,
    );

TextStyle kStyleSubTitleText({Color textColor, bool isBold = false}) =>
    TextStyle(
      fontSize: 18,
      // fontSize: Get.width * 0.045,
      // fontSize: getProportionateScreenWidth(18),
      color: textColor ?? MyColors.kTextColor,
      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
    );
TextStyle kStyleButtonSubmit(
        {Color textColor, bool isBold = false, bool useHeight = true}) =>
    TextStyle(
      color: textColor ?? MyColors.kWhite,
      fontSize: 16,
      // fontSize: getProportionateScreenWidth(16),
      // fontSize: Get.width * 0.04,
      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      letterSpacing: 1.1,
      height: useHeight ? 1.5 : null,
    );
TextStyle kStylePrimaryText({Color textColor, bool isBold = false}) =>
    TextStyle(
      fontSize: 14,
      // fontSize: Get.width * 0.035,
      // fontSize: getProportionateScreenWidth(14),
      color: textColor ?? MyColors.kTextColor,
      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
    );
TextStyle kStyleSecondaryLGText({Color textColor, bool isBold = false}) =>
    TextStyle(
      fontSize: 13,
      // fontSize: Get.width * 0.0325,
      // fontSize: getProportionateScreenWidth(13),
      color: textColor ?? MyColors.kTextColor,
      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
    );
TextStyle kStyleSecondaryText({Color textColor, bool isBold = false}) =>
    TextStyle(
      fontSize: 12,
      // fontSize: Get.width * 0.03,
      // fontSize: getProportionateScreenWidth(12),
      color: textColor ?? MyColors.kTextColor,
      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
    );

TextStyle kStyleTertiaryText({Color textColor, bool isBold = false}) =>
    TextStyle(
      fontSize: 11,
      // fontSize: Get.width * 0.0275,
      // fontSize: getProportionateScreenWidth(11),
      color: textColor ?? MyColors.kTextColor,
      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
    );

TextStyle kStyleAppBarTitle({Color textColor, bool isBold = false}) =>
    TextStyle(
      color: textColor ?? MyColors.kTextColor,
      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
    );

InputDecoration otpInputDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 50),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(50),
    borderSide: BorderSide(color: MyColors.kTextColor),
  );
}
