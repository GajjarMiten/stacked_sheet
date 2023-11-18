import 'dart:io';

import 'package:flutter/material.dart';

extension MediaQueryExt on BuildContext {
  Size get mediaQuerySize => MediaQuery.of(this).size;

  double get height => mediaQuerySize.height;

  double get width => mediaQuerySize.width;

  EdgeInsets get mediaQueryPadding => MediaQuery.of(this).padding;

  EdgeInsets get mediaQueryViewPadding => MediaQuery.of(this).viewPadding;

  EdgeInsets get mediaQueryViewInsets => MediaQuery.of(this).viewInsets;

  Orientation get orientation => MediaQuery.of(this).orientation;

  bool get isLandscape => orientation == Orientation.landscape;

  bool get isPortrait => orientation == Orientation.portrait;

  bool get alwaysUse24HourFormat => MediaQuery.of(this).alwaysUse24HourFormat;

  double get devicePixelRatio => MediaQuery.of(this).devicePixelRatio;

  Brightness get platformBrightness => MediaQuery.of(this).platformBrightness;

  double get textScaleFactor => MediaQuery.of(this).textScaleFactor;

  double get mediaQueryShortestSide => mediaQuerySize.shortestSide;

  bool get showNavbar => (width > 800);

  bool get isPhone => (mediaQueryShortestSide < 600);

  bool get isSmallTablet => (mediaQueryShortestSide >= 600);

  bool get isLargeTablet => (mediaQueryShortestSide >= 720);

  bool get isTablet => isSmallTablet || isLargeTablet;

  T? responsiveValue<T>({
    T? mobile,
    T? tablet,
    T? desktop,
  }) {
    var deviceWidth = mediaQuerySize.shortestSide;
    if (Platform.isMacOS || Platform.isWindows || Platform.isLinux) {
      deviceWidth = mediaQuerySize.width;
    }
    if (deviceWidth >= 1200 && desktop != null) return desktop;
    if (deviceWidth >= 600 && tablet != null) return tablet;
    return mobile;
  }

  Size get mqSize => MediaQuery.sizeOf(this);

  double get mqHeight => mqSize.height;

  double get mqWidth => mqSize.width;

  EdgeInsets get mqPadding => MediaQuery.paddingOf(this);

  EdgeInsets get mqViewPadding => MediaQuery.viewPaddingOf(this);

  EdgeInsets get mqViewInsets => MediaQuery.viewInsetsOf(this);

  Orientation get mqOrientation => MediaQuery.orientationOf(this);

  bool get mqAlwaysUse24HourFormat => MediaQuery.alwaysUse24HourFormatOf(this);

  double get mqDevicePixelRatio => MediaQuery.devicePixelRatioOf(this);

  Brightness get mqPlatformBrightness => MediaQuery.platformBrightnessOf(this);

  double get mqTextScaleFactor => MediaQuery.textScaleFactorOf(this);
}
