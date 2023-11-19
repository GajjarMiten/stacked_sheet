
import 'package:flutter/material.dart';

class StackedSheetOptions {
  final Duration? animationDuration;
  final Curve? animationCurve;
  final ShapeBorder? shape;
  final Color? sheetColor;

  final Duration? sheetOpenDuration;
  final Curve? sheetOpenCurve;
  final Duration? sheetCloseDuration;
  final Curve? sheetCloseCurve;
  const StackedSheetOptions({
    this.animationDuration,
    this.animationCurve,
    this.shape,
    this.sheetColor,
    this.sheetOpenDuration,
    this.sheetOpenCurve,
    this.sheetCloseDuration,
    this.sheetCloseCurve,
  });

  const StackedSheetOptions.defaultOptions()
      : animationCurve = Curves.linear,
        animationDuration = const Duration(milliseconds: 700),
        shape = const RoundedRectangleBorder(),
        sheetColor = Colors.white,
        sheetOpenDuration = const Duration(milliseconds: 700),
        sheetOpenCurve = Curves.linear,
        sheetCloseDuration = const Duration(milliseconds: 700),
        sheetCloseCurve = Curves.linear;

  StackedSheetOptions copyWith({
    Duration? animationDuration,
    Curve? animationCurve,
    ShapeBorder? shape,
    Color? sheetColor,
    Duration? sheetOpenDuration,
    Curve? sheetOpenCurve,
    Duration? sheetCloseDuration,
    Curve? sheetCloseCurve,
  }) {
    return StackedSheetOptions(
      animationDuration: animationDuration ?? this.animationDuration,
      animationCurve: animationCurve ?? this.animationCurve,
      shape: shape ?? this.shape,
      sheetColor: sheetColor ?? this.sheetColor,
      sheetOpenDuration: sheetOpenDuration ?? this.sheetOpenDuration,
      sheetOpenCurve: sheetOpenCurve ?? this.sheetOpenCurve,
      sheetCloseDuration: sheetCloseDuration ?? this.sheetCloseDuration,
      sheetCloseCurve: sheetCloseCurve ?? this.sheetCloseCurve,
    );
  }

  @override
  String toString() {
    return 'StackedSheetOptions(animationDuration: $animationDuration, animationCurve: $animationCurve, shape: $shape, sheetColor: $sheetColor, sheetOpenDuration: $sheetOpenDuration, sheetOpenCurve: $sheetOpenCurve, sheetCloseDuration: $sheetCloseDuration, sheetCloseCurve: $sheetCloseCurve)';
  }

  @override
  bool operator ==(covariant StackedSheetOptions other) {
    if (identical(this, other)) return true;

    return other.animationDuration == animationDuration &&
        other.animationCurve == animationCurve &&
        other.shape == shape &&
        other.sheetColor == sheetColor &&
        other.sheetOpenDuration == sheetOpenDuration &&
        other.sheetOpenCurve == sheetOpenCurve &&
        other.sheetCloseDuration == sheetCloseDuration &&
        other.sheetCloseCurve == sheetCloseCurve;
  }

  @override
  int get hashCode {
    return animationDuration.hashCode ^
        animationCurve.hashCode ^
        shape.hashCode ^
        sheetColor.hashCode ^
        sheetOpenDuration.hashCode ^
        sheetOpenCurve.hashCode ^
        sheetCloseDuration.hashCode ^
        sheetCloseCurve.hashCode;
  }
}
