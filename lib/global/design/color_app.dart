import 'package:flutter/material.dart';

class ColorManager {
  // Base Colors
  static const Color scaffoldLight = Color(0xffFCF8FF);
  static const Color scaffoldDark = Color(0xFF201630);

  static const Color primaryColor = Color(0xFF331E35);
  static const Color secondaryColor = Color(0xFFB7A4C6);
  static const Color thirdBlueColor = Color(0xFF806D95);

  static const Color buttonColor = Color(0xFF2563EB);
  static const Color textLight = Color(0xFF331E53);
  static const Color textDark = Color(0xFFFCF8FF);
  static const Color normalTextLight = Color(0xFF6B7280);
  static const Color normalText = Color(0xFF374151);

  static const Color pureWhite = Colors.white;
  static const Color whiteBackground = Color(0xFFf4f8fd);
  static const Color pureBlack = Color.fromARGB(255, 37, 37, 37);

  static const Color primaryIconColor = Color(0xFF374151);

  // Others
  static const Color grey = Color(0xFFD4D4D4);
  static const Color disableGrey = Color(0xFFD4D4D4);
  static const Color disableGreyButton = Color(0xFFEEEEEE);
  static const Color textGrey = Color(0xFF9E9E9E);
  static const Color labelGrey = Color(0xFF666666);
  static const Color hintGrey = Color(0xFFC2C2C2);
  static const Color primaryGreyText = Color(0xffADAEBC);
  static const Color secondaryText = Color(0xFF666666);
  static const Color navyBlue = Color(0xFF263238);
  static const Color green = Color(0xFF10b981);
  static const Color lightGreenApp = Color(0xFFE0FFEE);
  static const Color yellow = Color(0xFFFDC500);
  static const Color red = Color(0xFFFF2828);
  static const Color secondaryBlue = Color(0xFF0066B3);
  static const Color blackText = Color(0xff242424);
  static const Color white = Color(0xFFFFFFFF);
  static const Color softBlue = Color(0xFFE7F3FF);
  static const Color lighterGrey = Color(0xFF666666);
  static const Color containerGrey = Color(0xFFF4F4F4);
  static const Color softBlack = Color(0xFF131313);
  static const Color darkBlack = Color(0xFF111827);
  static const Color secondaryTextColor = Color(0xFF4B5563);
  static const Color blackBlue = Color(0xFF073B6D);

  static const Gradient gradientPrimaryColor = LinearGradient(
    colors: [Color(0xff073b6d), Color(0xff145b8f), Color(0xff00b4e5)],
    stops: [0.09, 0.5, 1],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
