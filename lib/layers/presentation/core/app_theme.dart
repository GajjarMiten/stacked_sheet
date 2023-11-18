import 'package:flutter/material.dart';
import 'package:stacked_sheet/layers/presentation/utils/sizeconfig.dart';

mixin AppThemeMixin {
  final Color primaryColor = const Color(0xff090808);
  final Color secondaryColor = const Color(0xffFF3A6F);

  Color get primaryInverseColor => const Color(0xffffffff);

  Color get defaultFontColor => primaryInverseColor;

  double get paddingUnit => 16;

  double get sizeH1 => 24.sp;
  double get sizeH2 => 20.sp;
  double get sizeH6 => 10.sp;

  TextStyle get headingTextStyle => TextStyle(
        fontSize: sizeH1,
        fontWeight: FontWeight.bold,
      );

  TextStyle get bodyTextStyle => TextStyle(
        fontSize: 16.sp,
      );
}

class DarkTheme with AppThemeMixin {}

class LightTheme with AppThemeMixin {}

final AppThemeMixin appTheme = DarkTheme();