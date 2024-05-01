import 'package:flutter/material.dart';

abstract class AppColors {
  // scheme color
  Color primaryColor = const Color(0xFFE3823C);
  Color primaryColor2 = const Color(0xFFE33C3C);
  Color primaryColor3 = const Color(0xFFE3B53C);
  Color primaryColor4 = const Color(0xFFF8F8F8);
  Color primaryColor5 = const Color(0xFF23203F);

  // background color
  Color bgColor1 = const Color(0xFF141326);
  RadialGradient bgColor2 = const RadialGradient(
    colors: [
      Color(0xFFE33C3C),
      Color(0xFF141326),
    ],
  );

  // text color
  Color textColor1 = const Color(0xFFFFFFFF);
  Color textColor2 = const Color(0xFFE3B53C);
}
