import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:stacked_sheet/layers/presentation/utils/sizeconfig.dart';

interface class IAppTheme {
  final Color primaryColor = const Color(0xff090808);
  final Color secondaryColor = const Color(0xffFF3A6F);
  final Color greyColor = const Color(0xff272829);
  final Color iosBlueColor = const Color(0xff5ac8fa);

  Color get primaryInverseColor => const Color(0xffffffff);

  Color get defaultFontColor => primaryInverseColor;

  double get paddingUnit => 16;

  double get sizeH1 => 24.sp;
  double get sizeH2 => 20.sp;
  double get sizeH3 => 18.sp;
  double get sizeH6 => 10.sp;

  TextStyle get headingTextStyle => TextStyle(
        fontSize: sizeH1,
        fontWeight: FontWeight.bold,
      );

  TextStyle get bodyTextStyle => TextStyle(
        fontSize: 16.sp,
      );

  Duration get animationDuration => 400.milliseconds;
  Duration get animationDelay => 50.milliseconds;
}

class DarkTheme extends IAppTheme {}

class LightTheme extends IAppTheme {}

final IAppTheme appTheme = DarkTheme();
