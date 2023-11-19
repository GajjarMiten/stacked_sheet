import 'package:flutter/material.dart';
import 'package:stacked_sheet/layers/presentation/core/app_theme.dart';

class CustomText extends Text {
  final Color? color;
  final String? fontFamily;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? wordSpacing;
  final double? letterSpacing;
  final double? height;
  final bool textUnderLine;
  final TextStyle? textStyle;

  CustomText(
    String text, {
    this.color,
    this.fontFamily,
    this.fontSize,
    this.fontWeight,
    this.height,
    this.textUnderLine = false,
    this.letterSpacing,
    this.wordSpacing,
    this.textStyle,
    super.textAlign = TextAlign.center,
    super.overflow,
    super.key,
  }) : super(
          text,
          style: textStyle ??
              TextStyle(
                color: color ?? appTheme.defaultFontColor,
                fontFamily: fontFamily,
                fontSize: fontSize,
                fontWeight: fontWeight,
                height: height,
                decoration: textUnderLine
                    ? TextDecoration.underline
                    : TextDecoration.none,
                letterSpacing: letterSpacing,
                wordSpacing: wordSpacing,
              ),
        );

  CustomText.h1(
    String text, {
    this.color,
    this.fontFamily,
    this.fontSize,
    this.fontWeight,
    this.height,
    this.textUnderLine = false,
    this.letterSpacing,
    this.wordSpacing,
    this.textStyle,
    super.textAlign = TextAlign.center,
    super.overflow,
    super.key,
  }) : super(
          text,
          style: textStyle ??
              appTheme.headingTextStyle.copyWith(
                color: color ?? appTheme.defaultFontColor,
                fontFamily: fontFamily,
                fontSize: fontSize,
                fontWeight: fontWeight,
                height: height,
                decoration: textUnderLine
                    ? TextDecoration.underline
                    : TextDecoration.none,
                letterSpacing: letterSpacing,
                wordSpacing: wordSpacing,
              ),
        );

  CustomText.h2(
    String text, {
    this.color,
    this.fontFamily,
    this.fontSize,
    this.fontWeight,
    this.height,
    this.textUnderLine = false,
    this.letterSpacing,
    this.wordSpacing,
    this.textStyle,
    super.textAlign = TextAlign.center,
    super.overflow,
    super.key,
  }) : super(
          text,
          style: textStyle ??
              appTheme.headingTextStyle.copyWith(
                color: color ?? appTheme.defaultFontColor,
                fontFamily: fontFamily,
                fontSize: fontSize ?? appTheme.sizeH2,
                fontWeight: fontWeight,
                height: height,
                decoration: textUnderLine
                    ? TextDecoration.underline
                    : TextDecoration.none,
                letterSpacing: letterSpacing,
                wordSpacing: wordSpacing,
              ),
        );

  CustomText.h6(
    String text, {
    this.color,
    this.fontFamily,
    this.fontSize,
    this.fontWeight,
    this.height,
    this.textUnderLine = false,
    this.letterSpacing,
    this.wordSpacing,
    this.textStyle,
    super.textAlign = TextAlign.center,
    super.overflow,
    super.key,
  }) : super(
          text,
          style: textStyle ??
              appTheme.headingTextStyle.copyWith(
                color: color ?? const Color(0xffE3E3E3).withOpacity(0.9),
                fontFamily: fontFamily,
                fontSize: fontSize ?? appTheme.sizeH6,
                fontWeight: FontWeight.w400,
                height: height,
                decoration: textUnderLine
                    ? TextDecoration.underline
                    : TextDecoration.none,
                letterSpacing: letterSpacing,
                wordSpacing: wordSpacing,
              ),
        );

  const CustomText.rich(
    InlineSpan textSpan, {
    this.color,
    this.fontFamily,
    this.fontSize,
    this.fontWeight,
    this.height,
    this.textUnderLine = false,
    this.letterSpacing,
    this.wordSpacing,
    this.textStyle,
    super.textAlign = TextAlign.center,
    super.overflow,
    super.key,
  }) : super.rich(textSpan, style: textStyle);
}
